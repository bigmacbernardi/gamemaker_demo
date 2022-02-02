// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}


/*function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}*/

function checkForHit(unit = global.selectedUnit){//checks for physical attack
	var number = random(1);
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}

function useItem(){
	show_debug_message(global.selectedUnit.title+" using "+ global.itemInUse[0].title +" on " + global.targets[0].title);
	/*	with(global.targets[0]){
			state = MISS;
			//getting-healed animation?
		}*/
	
}
function elementalAttack(element,strength=1,target=global.targets[0],unit=global.selectedUnit){
		checkForHit(unit);
		if (unit.attackWillHit){
			var dmg;
			switch(element){
				case 0: //earth
					dmg = ceil(strength*((unit.current[@ DEFEND]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 1: //wind
					dmg = ceil(strength*((unit.current[@ SPD]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 2: //fire
					dmg = ceil(strength*unit.current[@ STR]*unit.current[@ DEX]);
					break;
				case 3: //water
					dmg = ceil(strength*((unit.current[@ AGI]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 4: //shadow
					dmg = ceil(strength*((unit.current[@ CHA]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 5: //light
					dmg = ceil(strength*((unit.current[@ DEX]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 6: //energy
					dmg = ceil(strength*((unit.current[@ WIS]/2)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
				case 7: //void
					dmg = unit.current[@ HP];
					break;
				case 8: //bio (poison)
				
					dmg = ceil(strength*((unit.current[@ AGI]/2)+(unit.current[@ STR]/2))
								*unit.current[@ CHA]);
					//if !immune
						target.status[0]=-ceil(dmg/14);
					break;
				case 9: //ice
					dmg = ceil(strength*((unit.current[@ AGI]/4)+(unit.current[@ CHA]/4)+(unit.current[@ STR]/2))
								*unit.current[@ DEX]);
					break;
			}
			with(target){
					incomingDamage = dmg; //should account for def here and use separate attack power IMO, but whatever
					incomingElement = element;
					show_debug_message("INCOMING ELEMENTAL DAMAGE: "+string(incomingDamage));
					layer_sequence_headpos(unitSequence,hitStart);
					audio_play_sound(damageSound,100,false);
					state = HIT;
			}
		}
		else{
			with(target){
				show_debug_message("OFFICIALLY ELEMISSING");
				incomingDamage=0;
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
			}	
		}
		if target == unit{
			if !battle_manager.selectedFinished{
				show_debug_message("Didn't finish after elementing yourself");//wasn't doin it
				with battle_manager	selectedFinished = true;
			}
		}
}
function unitAttack(){
	var unit = global.selectedUnit;
	if unit < 0 return; //emergency fix
	else{
		if global.targets[0] < 0 global.targets[0]=unit.isPlayer?global.enemies[|0]:global.allies[|0];//auto-fix
		show_debug_message(global.selectedUnit.title+" attacking "+
			global.targets[0].title+"#"+string(global.targets[0]));
	}
	var targets = global.targets;
	for (var i = 0; i < array_length(targets); i++){ //should recalculate and put outside, but that's not how attack works rn
		checkForHit(unit);
		/*var orig_x = unit.x;
		var orig_y= unit.y;
		var xStep = (targets[i].x - orig_x) / 20;
		var yStep = (targets[i].y - orig_y) / 20;
		repeat(20){
		     orig_x += xStep;
		     orig_y += yStep;
			 layer_sequence_x(unit.unitSequence,orig_x);
			 layer_sequence_y(unit.unitSequence,orig_y);
		}*///attempt to make animation work
		if (unit.attackWillHit){
	//if global.targets[i]==noone continue;//emergency fix
			//else show_debug_message("Hitting "+string(global.targets[i]));
			with(targets[i]){
					incomingDamage = ceil(unit.current[@ STR]); //should account for def here and use separate attack power IMO, but whatever
					incomingElement = -1;//physical
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					layer_sequence_headpos(unitSequence,hitStart);
					audio_play_sound(damageSound,100,false);
					state = HIT;
			}
		}
		else{
			with(targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
			}	
		}
		if targets[i] == unit{
			if !battle_manager.selectedFinished{
				show_debug_message("Didn't finish after swatting yourself");//wasn't doin it
				with battle_manager{
					selectedFinished = true;	
				}
			}
		}
	}

	/*repeat(20){
	     orig_x -= xStep;
	     orig_y -= yStep;
		 layer_sequence_x(unit.unitSequence,orig_x);
		 layer_sequence_y(unit.unitSequence,orig_y);
	}*/
	with battle_manager{
		enqueue(unit);	
	}
}
	


function equip(char,equI){//character, equipment index
	//show_debug_message(global.equipment[|equI]);
	//show_debug_message("round equi: "+global.names[char]+" gets equipment #"+string(round(equI)));
	var entry = ds_list_find_value(global.equipment,equI);
	//show_debug_message("in slot "+string(entry.category));
	//if (is_array(equI))entry = global.equipment[|equI[0]];
	//else entry = global.equipment[|equI];
	global.equipped[char][entry.category] = entry;//equipping item to character data
	entry.currentUser=char;//equipping character to equipment (used to track "taken" weapons)

}

function revive_targets(amt=1){
	//IF AMT <= 1.0, recovery is fractional.
	//IF AMT > 1, recovery is fixed
	for (var i = 0; i<array_length(global.targets);i++){
		var unit = global.targets[i];
		if (unit.state==DEATH){
			var recoverAmt = (amt>1)?floor(amt):round(amt*unit.base[HP]);
			//if instance_exists(battle_manager)	{
			with unit{
				current[HP] = recoverAmt;
				layer_sequence_headpos(unitSequence, idleStart);
				state = IDLE;
			}
			ds_list_add(unit.isPlayer?global.allies:global.enemies,unit);
			with battle_manager{
				enqueue(unit);
				totalUnits++;
			}
			//}
		}
	}
}

function isReady(partner,amAlly=true){//pass in .teammate var
	if (!instance_exists(battle_manager))//SHOULD NOT BE CALLED OUTSIDE OF BATTLE
		return false;
	else{
			
	}
	//check queue
	//if enemy of character found in queue before partner
		//return false
	//if partner found in queue before an enemy
		//return true
}

function setParticle(int){
	var debug_names = ["Healing","Wind","Fire","Water","Shadow","Light","Electric","Ice","Spirit"];
	show_debug_message("Casting "+debug_names[int]+" magic");
	switch(int){
		case 0: //heal
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 1:	//wind
				part_type_shape(global.Particle1, pt_shape_line);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_ltgrey);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,269,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 2: //fire
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_red);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 3:	//Water
				part_type_shape(global.Particle1, pt_shape_cloud);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_blue);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 4:	//Shadow
				part_type_shape(global.Particle1, pt_shape_smoke);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_dkgrey);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 5:	//Light
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 6:	//Electric
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 7:	//Ice
				part_type_shape(global.Particle1, pt_shape_snow);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_aqua);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 8:	//Fighting spirit (Shadow + energy + fire + earth)
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_yellow);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
	}

}
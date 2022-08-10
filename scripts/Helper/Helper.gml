// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}
#macro castStandard 1337
function getRoomName(rm = room){
	switch (rm){
		case start_menu:
			return "Startup";
		case Room2:
			return "Opening Test Room";
		case d1hall1:
			return "Ancyran Archive - Great Hall, Lv 3 (Old)";
		case d1hall2:
			return "Ancyran Archive - Great Hall, Lv 2";
		case d1hall3:
			return "Ancyran Archive - Great Hall, Lv 1";
		case Room1:
			return "Elder's Hall";
		case gameover:
			return "Game over realm";
		case Room3:
			return "Ski Ball Hall";
		case depthtest_1:
			return "Depth Test 1";
		case depth_test_smaller:
			return "Depth Test 2";
		case depth_size_test:
			return "Scaling depth test room";
		case d1bookhall:
			return "Ancyran Archive - Path to Library";
		case d1entrcha:
			return "Ancyran Archive - Upper Archive";
        case d1stairs:
			return "Ancyran Archive - Stairwell";
        case d1library1:
			return "Ancyran Archive - Library, Lv 3"; 
		case d1libalcony:
			return "Ancyran Archive - Library Balcony";
		case d1hall1redux:
			return "Ancyran Archive - Great Hall, Lv 3";
		case d1library2:
			return "Ancyran Archive - Library, Lv 2";
		case d1sanc1:
		case d1sanc2:
		case d1sanc3:
		case d1sancliminal:
			return "Ancyran Archive - Sanctuary";
		case d1archlab:
			return "Ancyran Archive - Archeology Lab";
		case d1lab1:
			return "Ancyran Archive - Biology Lab, Lv 3";
		case d1lab2:
			return "Ancyran Archive - Biology Lab, Lv 2";
		case d1columb1:
		case d1columb2:
			return "Ancyran Archive - Columbarium";
		case d1save1:
		case d1save2:
			return "Ancyran Archive - Safe Room";
		case d1extravault1:
			return "Ancyran Archive - Vault";
		case d1artifacts:
			return "Ancyran Archive - Artifact Safe";
		case d1relicroom:
			return "Ancyran Archive - Relic Vault";
		case T1Ancyra1:
			return "Ancyra";
		case T1YusufHouse:
			return global.names[YUSUF]+"'s House";
		case T1YusufRoom:
			return global.names[YUSUF]+"'s Room";
        case mystery_zone:
            return "Mystery Zone";
		case  T1AncyraCrimeAlley:
			return "Ancyra - Crime Alley";
		case mobile_hall:
			return "Mobile Base";
	    case cave0:
	        return "Frosty Cavern";
		case T1ShootingGalleryRoom:
			return "Ancyra Shooting Gallery";
		case d1admin:
			return "Ancyran Archive - Administration Room";
		case d0woods1:
			return "Ancyra Woods";
		case d0woods2tree:
			return "Ancyra Woods - Great Tree";
			
		/*case battle_area:
		case battle_d1area:
		case battle_d1shelves:
		case basicalleyfightroom:
		case Minigame0:*/
		default:
			return "[No name available]";
			//return global.location_name;//ultimately want this.  no change
			
	}
}
/*function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}*/

function checkForHit(unit = global.selectedUnit){//checks for physical attack
	var number = random(1);
	//show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])+", rolled a "+string(10-(number*10))+")");
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
function elemAttack(element,strength=1,unit=global.selectedUnit,target=global.targets[0]){
		//calculates power HERE from level
		checkForHit(unit);
		if (unit.attackWillHit){
			var dmg = 0;
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
function unitAttack(unit = global.selectedUnit,targets = global.targets,thatsIt = true){
	if unit < 0 return; //emergency fix
	else{
		if targets[0] < 0 targets[0]=unit.isPlayer?global.enemies[|0]:global.allies[|0];//auto-fix
		show_debug_message(unit.title+" attacking AT LEAST "+
			targets[0].title+"#"+string(global.targets[0]));
	}
	//var targets = global.targets;
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
					incomingDamage = ceil(unit.current[@ STR]); //WILL account for def here and use separate attack power IMO, but whatever
					incomingElement = -1;//physical
					//show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					layer_sequence_headpos(unitSequence,hitStart);
					audio_play_sound(damageSound,100,false);
					state = HIT;
			}
		}
		else{
			with(targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				with battle_menu{
					show_debug_message(string(instance_count)+" battle_menus");
				}
				with battle_yusuf{
					show_debug_message(string(instance_count)+" yusufs");
				}
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
	if thatsIt with battle_manager{
		enqueue(unit);	
	}
}
	


function equip(char,equI){//character, equipment index
	//doesn't unequip, not sure if needed with equip menu functionality
	var entry = ds_list_find_value(global.equipment,equI);
	var piece = instance_create_depth(0,0,0,entry[0]);
	global.equipped[char][piece.category] = equI;//equipping item to character data
	instance_destroy(piece);
	//global.equipped[char][entry.category] = entry;//old method
	
	entry[1]=char;//equipping character to equipment (used to track "taken" weapons)
	//entry.currentUser=char; //old method
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
	var debug_names = ["Earth","Wind","Fire","Water","Dark","Light","Electric","Kiai","Poison","Ice",
						"Crystal","Magma","Acid","Rainbow","Healing","Curing","Buffing","Time","Protective","Hydra"];
	show_debug_message("Casting "+debug_names[int]+" magic");
	switch(int){
		case 16: //heal
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
		case 0:	//earth
				part_type_shape(global.Particle1, pt_shape_line);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_maroon);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,269,0,20);
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
		default://Fighting spirit clone
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

/* DEBUG FUNCTIONS
 DEBUG FUNCTIONS
 DEBUG FUNCTIONS
 DEBUG FUNCTIONS
 DEBUG FUNCTIONS
 DEBUG FUNCTIONS
*/
function checkForOpenSpace(xx,yy,x_gap,y_gap){//not even using
	show_debug_message("Checking "+string(xx)+","+string(yy));
    if !(obj_player.place_meeting(xx,yy,obj_wall) or obj_player.place_meeting(xx,yy,checkable) or obj_player.place_meeting(xx,yy,obj_warp)){
	   
		show_debug_message("Success at: "+string(xx)+","+string(yy));
	   obj_player.x = xx;
	   obj_player.y = yy;
	   return true;
	}
    else if checkForOpenSpace(xx-x_gap,yy-y_gap,x_gap/2,y_gap/2)
		return true;
	else if checkForOpenSpace(xx-x_gap,yy+y_gap,x_gap/2,y_gap/2)
		return true;	
	else if checkForOpenSpace(xx+x_gap,yy-y_gap,x_gap/2,y_gap/2)
		return true;	
	else if checkForOpenSpace(xx+x_gap,yy+y_gap,x_gap/2,y_gap/2)
		return true;
	else return false;

}
function defaultConfig(){
	//put spells into "normal" order
	//search through all skills, put them in their default place
	//
}
function standardActions(isSpellcaster=0){//returns a ds_list with all the normal actions; used OUTSIDE of battle
	var toReturn = ds_list_create();
	//FORMAT:  [Name, action, type (deepest menu allowed), current menu]
	//TYPES: 0 = Default only; 1 = Skill; 2 = Magic (subset of skill); 3 = Speech (handled differently at the time of this co
	ds_list_add(toReturn,["Attack",attack,1,0]);
	ds_list_add(toReturn,["Skills",skills,0,0]);
	//if (isSpellcaster) 
	ds_list_add(toReturn,["Magic",magic,1,!isSpellcaster]);//look up how I filtered magic action bc idr
	if (!isSpellcaster) ds_list_add(toReturn,["Talk",talk,1,0]);
	else ds_list_add(toReturn,["Speech",talk,1,1]);
	ds_list_add(toReturn,["Items",item,1,0]);
	ds_list_add(toReturn,["Dual",dual,1,0]);
	ds_list_add(toReturn,["Wait",wait,0,0]);
	ds_list_add(toReturn,["Flee",flee,1,0]);
	return toReturn;
}
function standardSpells(){
	var battling = instance_exists(battle_menu);
	if battling
		return standardSpells()
}

/*function spellsForBattle(unit){//HAS to happen on global data, for config stuff
var battling = instance_exists(battle_menu);
	if !battling
		return standardSpells()
	var index = unit.ind;
	var names = ["Quake","Gale","Flame","Torrent","Dark","Nova","Shock","Kiai","Bitch"];//torrent=>flood?
	var costs = [[5,10,16],[]];
	for (var i = 0;i<array_length(names);i++){
		var n = names[i];
		//deepest allowed NOT NEEDED!
		var a = castStandard
		//for (var j = 0;j<global.spellLv[index][i];j++){
		if global.spellLv[index][i]>0 {
			var insertIt = [names[i],castStandard,2,0,costs[i][j],i,global.spellLv[index][i]];
			//if battling
		
		//else do this however	ds_list_add(list,);
		}
	}
}*/
function learnSkill(charIndex,name,action,defaultPlace=1,element=-1,level=0){
		var entry = [name,action,defaultPlace,defaultPlace];
		if level > 0{
			entry[4]=element;//has to maintain order
			entry[5]=level;
		}
		else if element > -1 entry[4]=element;
		ds_list_add(global.actions[charIndex],entry);
}
function learnStartingSkills(){
		learnSkill(AOI,"Burn",cast,2,2);//magic menu; fire elemental; no level
		learnSkill(AOI,"Freeze",freeze,2,10);//magic menu; ice elemental; no level
		learnSkill(YUSUF,"Balm",balm,1,14);//skill menu; HP elemental
		learnSkill(YUSUF,"Intensive Care",intensiveCare,1,15);//skill menu; esuna elemental
		
}
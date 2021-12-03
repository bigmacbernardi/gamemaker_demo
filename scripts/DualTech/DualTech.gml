// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DualTech(){
//seems like we can just ignore this
}

/* AOI + YUSUF TECH */

function IcyHeat(){
	var enemies = rigid_selector.targetSet1;		 
	var friends = rigid_selector.targetSet2;
	global.targets = enemies;
	var unitX = global.selectedUnit.x + global.selectedUnit.teammate.x / 2;
	var unitY = global.selectedUnit.y + global.selectedUnit.teammate.y / 2;	
	with battle_aoi{
		current[MP] -= 4;
		layer_sequence_headpos(unitSequence,atkStart);
		state = ATTACK;
	}
	setParticle(7);//fire;
	for(var i = 0; i < array_length(global.targets); i++){
		show_debug_message(global.selectedUnit.title+" attacking "+global.targets[i].title+"#"+string(global.targets[i]));
		var xStep = (global.targets[i].x - unitX )/10;
		var yStep = (global.targets[i].y - unitY )/10;
		var partX = unitX;
		var partY = unitY;
		//part_type_direction(global.Particle1,)
		
		repeat(10)
		{
			partX+=xStep;
			partY+=yStep;
			part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
		}
		//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 10);
		checkForHit();
		if (global.selectedUnit.attackWillHit){
			with(global.targets[i]){ // Freeze Attack / 4
					incomingDamage = round((battle_aoi.current[@ WIS]*1.25) + (battle_aoi.current[@ STR] / 4)* ((battle_aoi.current[@ AGI] / 2)+(battle_aoi.current[@ CHA] / 2)))/4;
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					layer_sequence_headpos(unitSequence,hitStart);
					state = HIT;
			}
		}
		else{
			with(global.targets[i]){
				show_debug_message("ICY_HEAT OFFICIALLY MISSING");
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
			}
		}
	 }
	global.targets = friends;
	setParticle(2);//fire
	with battle_yusuf{
		current[MP] -= 4;
		layer_sequence_headpos(unitSequence,atkStart);
		state = ATTACK;
	}
	part_particles_create(global.P_System, battle_yusuf.x, battle_yusuf.y, global.Particle1, 10);
	
	for(var i = 0; i < array_length(global.targets); i++){
		part_particles_create(global.P_System, global.targets[i].x, global.targets[i].y, global.Particle1, 3);
		if (global.targets[i].state != DEATH){
	        with global.targets[i]{
				incomingDamage = round(base[HP]/7);//scale to water stat
				layer_sequence_headpos(unitSequence,hitStart);
				state = HEAL;
			}
		}
	}
	with battle_manager{
		enqueue(global.selectedUnit.teammate);//but the units must be up to something else lol
		alarm[1]=10;
	}
	instance_destroy(rigid_selector);
	
	//battle_manager.alarm[1]=1;//naive interpretation - just pushes through the queue
	/*with global.selectedUnit.teammate{
		isHolding = true;//.something
	}*/
}


function MuguMugu(){
	var unitX = (global.selectedUnit.x + global.selectedUnit.teammate.x) / 2;
	var unitY = (global.selectedUnit.y + global.selectedUnit.teammate.y) / 2;	
	setParticle(0);//idk;
	for(var i = 0; i < array_length(global.targets); i++){
		show_debug_message(global.selectedUnit.title+" attacking "+global.targets[i].title+"#"+string(global.targets[i]));
		var xStep = (global.targets[i].x - unitX )/10;
		var yStep = (global.targets[i].y - unitY )/10;
		var partX = unitX;
		var partY = unitY;
		//part_type_direction(global.Particle1,)
		
		repeat(10)
		{
			partX+=xStep;
			partY+=yStep;
			part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
		}
		//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 10);
		checkForHit();
		if (global.selectedUnit.attackWillHit){
			with(global.targets[i]){ // Freeze Attack / 4
					incomingDamage = round(((battle_aoi.current[@ WIS]*1.25) + (battle_aoi.current[@ STR] / 4)* ((battle_aoi.current[@ AGI] / 2)+(battle_aoi.current[@ CHA] / 2)))/4);
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					layer_sequence_headpos(unitSequence,hitStart);
					state = HIT;
			}
		}
		else{
			with(global.targets[i]){
				show_debug_message("ICY_HEAT OFFICIALLY MISSING");
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
			}
		}
	 }
	with battle_manager{
		enqueue(global.selectedUnit.teammate);//but the units must be up to something else lol
		alarm[1]=10;
	}
	
}

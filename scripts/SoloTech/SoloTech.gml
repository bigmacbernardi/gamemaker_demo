// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SoloTech(){
//seems like we can just ignore this
}

/* AOI TECH */

function burn(){
	var unit = global.selectedUnit;	
	unit.current[MP] -= 4;
	setParticle(2);//fire;
	for(var i = 0; i < array_length(global.targets); i++){
		show_debug_message(global.selectedUnit.title+" attacking "+global.targets[i].title+"#"+string(global.targets[i]));
		part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 10);
		checkForHit();
		if (unit.attackWillHit){
			with(global.targets[i]){ // (Energy) * (Fire) / 4
					incomingDamage = round(unit.current[@ WIS] * unit.current[@ STR]/4);
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					state = HIT;
					layer_sequence_headpos(unitSequence,hitStart);
			}
		}
		else{
			with(global.targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				state = MISS;
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
			}
		}
	 }
	battle_manager.alarm[1] = 10;		 
}

function freeze(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets[0].title+"#"+string(global.targets[0]));
	checkForHit();
	setParticle(7);//ice
	var unit = global.selectedUnit;
	unit.current[MP] -= 4;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	if (unit.attackWillHit){
		with(global.targets[0]){ // (Energy*1.25 + Fire/4) * (Ice/2 + Shadow/2)  ... / Earth * (Ice/2 + Shadow/2)?
				incomingDamage = round((unit.current[@ WIS]*1.25) + (unit.current[@ STR] / 4)* ((unit.current[@ AGI] / 2)+(unit.current[@ CHA] / 2)));
				show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
				//alarm[0] = 10;
				state = HIT;
				layer_sequence_headpos(unitSequence,hitStart);
		}
	}
	else{
		with(global.targets[0]){
			show_debug_message("OFFICIALLY MISSING");
			state = MISS;
			if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
			layer_sequence_headpos(unitSequence,missStart);
		}
	}
	battle_manager.alarm[1] = 10;
	//complete the turn?
}

/* YUSUF TECH */


function embolden(){
	var unit = global.selectedUnit;
	setParticle(8);//Fighting energy
	unit.current[MP] -= 2;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	for(var i = 0; i < ds_list_size(global.allies); i++){//probably gonna be called BY skill_selector, so take out the selection logic
		if (global.allies[|i].state != DEATH){
	        
			global.targets = [global.enemies[|i]];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
			}
	 	}		 
	battle_manager.alarm[1] = 10;
}

function balm(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 5;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state != DEATH){
	        
			global.targets[i] = global.allies[|i];
			var inst = instance_create_layer(global.allies[|i].x, global.allies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;//do something different lol
			
			}
	 	}	
	battle_manager.alarm[1] = 10;	 
}

function intensiveCare(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 10;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state == DEATH){
			part_particles_create(global.P_System, global.allies[|i].x, global.allies[|i].y, global.Particle1, 20);
			
			global.allies[|i].current[HP] = round(global.allies[|i].base[HP]/2);
			global.allies[|i].state = IDLE;
			break;
			}
	 	}		
	battle_manager.alarm[1] = 10; 
}
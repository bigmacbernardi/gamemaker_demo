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
		var xStep = (global.targets[i].x - unit.x )/40;
		var yStep = (global.targets[i].y - unit.y )/40;
		var partX = unit.x;
		var partY = unit.y;
		//part_type_direction(global.Particle1,)
		
		repeat(40)
		{
			partX+=xStep;
			partY+=yStep;
			part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
		}
		//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 10);
		checkForHit();
		if (unit.attackWillHit){
			with(global.targets[i]){ // (Energy) * (Fire) / 4
					incomingDamage = round(unit.current[@ WIS] * unit.current[@ STR]/4);
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					//alarm[0] = 10;
					layer_sequence_headpos(unitSequence,hitStart);
					state = HIT;
			}
		}
		else{
			with(global.targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
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
	var xStep = (global.targets[0].x - unit.x )/40;
	var yStep = (global.targets[0].y - unit.y )/40;
	var partX = unit.x;
	var partY = unit.y;
	//part_type_direction(global.Particle1,)
		
	repeat(40)
	{
		partX+=xStep;
		partY+=yStep;
		part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
	}
	//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	if (unit.attackWillHit){
		with(global.targets[0]){ // (Energy*1.25 + Fire/4) * (Ice/2 + Shadow/2)  ... / Earth * (Ice/2 + Shadow/2)?
				incomingDamage = round((unit.current[@ WIS]*1.25) + (unit.current[@ STR] / 4)* ((unit.current[@ AGI] / 2)+(unit.current[@ CHA] / 2)));
				show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
				//alarm[0] = 10;
				layer_sequence_headpos(unitSequence,hitStart);
				state = HIT;
		}
	}
	else{
		with(global.targets[0]){
			show_debug_message("OFFICIALLY MISSING");
			if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
			layer_sequence_headpos(unitSequence,missStart);
			state = MISS;
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
	with(global.targets[0]){
		current[STR]+=1.5;//HELL yes
		layer_sequence_headpos(unitSequence,hitStart);
		state = HEAL;
	}
	battle_manager.alarm[1] = 10;
}

function balm(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 5;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	
	for(var i = 0; i < array_length(global.targets); i++){
		part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 2);
		if (global.targets[i].state != DEATH){
	        with global.targets[i]{
				incomingDamage = round(base[HP]/6);//scale to water stat
				layer_sequence_headpos(unitSequence,hitStart);
				state = HEAL;
			}
		}
	}	
	battle_manager.alarm[1] = 10;	 
}

function intensiveCare(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 10;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	if (global.targets[0].state == DEATH){
		part_particles_create(global.P_System, global.targets[0].x, global.targets[0].y, global.Particle1, 20);
			
		global.targets[0].current[HP] = round(global.targets[0].base[HP]/2);
		global.targets[0].state = IDLE;
		}
	battle_manager.alarm[1] = 10; 
}
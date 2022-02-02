// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SoloTech(){
//seems like we can just ignore this
}
/* UNIVERSAL */
function flee(){
	//100% success rate
	with battle_manager{
		animCounter = 60;
		combatPhase = phase.escape;
	}
	//battle_manager.alarm[1]=10;
}
/* NEAR UNIVERSAL */
function bribe_attempt(electrum,gold,target=global.targets[0]){
	var roll = irandom(99);
	if variable_instance_exists(target,"price"){
		if electrum>target.price{
			var drop = target.electrum_prize[0];
			if roll > 100-target.electrum_prize[1]{
				/*add item*/
				if (object_get_parent(drop)==equippable) or 
						(object_get_parent(object_get_parent(drop))==equippable){
						//show_debug_message("It's a weapon, "+object_get_name(object_get_parent(unit.drops[i][0])));
						var thing = instance_create_depth(0,0,1,drop);
						ds_list_add(global.equipment,thing);
						with battle_manager ds_list_add(futureMessages,"Found "+thing.title+"!");
				}
				else{
					var found = -1;
					for (var j = 0;i<ds_list_size(global.inventory);j++){
						//show_debug_message("Checkin "+object_get_name( global.inventory[|i][0] ));
						if global.inventory[|j][0] == drop{
						//	show_debug_message("MATCH!");
							found = j;
							break;
						}
					}
					if found>-1{//instance_exists(contents){
						show_debug_message("It's an old item, a(n) "+object_get_name(object_get_parent(drop)));
						global.inventory[|found][1]++;
					}
					else{
						show_debug_message("It's a new item, a(n) "+object_get_name(object_get_parent(drop)));
						ds_list_add(global.inventory,[drop,1]);	
					}					
					var this = instance_create_depth(0,0,1,drop);
					with battle_manager ds_list_add(futureMessages,"Got "+this.title+" through bribery!");
					instance_destroy(this);
				}
			}
		}
	}
	if variable_instance_exists(target,"price2"){
		if gold>target.price2{
			var drop = target.gold_prize[0];
			if roll > 100-target.gold_prize[1]{
				/*add item*/
						if (object_get_parent(drop)==equippable) or 
						(object_get_parent(object_get_parent(drop))==equippable){
							//show_debug_message("It's a weapon, "+object_get_name(object_get_parent(unit.drops[i][0])));
							var thing = instance_create_depth(0,0,1,drop);
							ds_list_add(global.equipment,thing);
							ds_list_add(futureMessages,"Found "+thing.title+"!");
						}
						else{
							var found = -1;
							for (var j = 0;i<ds_list_size(global.inventory);j++){
								if global.inventory[|j][0] == drop{
									found = j;
									break;
								}
							}
							if found>-1{//instance_exists(contents){
								show_debug_message("It's an old item, a(n) "+object_get_name(object_get_parent(drop)));
								global.inventory[|found][1]++;
							}
							else{
								show_debug_message("It's a new item, a(n) "+object_get_name(object_get_parent(drop)));
								ds_list_add(global.inventory,[drop,1]);	
							}					
							var this = instance_create_depth(0,0,1,drop);
							ds_list_add(futureMessages,"Got "+this.title+"!");
							instance_destroy(this);
						}
				with battle_manager
					ds_list_add(futureMessages,"Got a rare thing!");
			}		
		}
	}
	with battle_manager{
		ds_list_delete(global.enemies,target);
		expEarned += target.xp_value;
	}
}
function converse(){//open up dialogue window
	var unit = global.selectedUnit;
	if unit<0{
		battle_manager.alarm[1]=10;
		return;
	}
	for (var i=0;i<array_length(global.targets);i++){
		var target = global.targets[i];
		if target<0 continue;
		with target{//enemy-specific dialogue behavior
			event_user(1);	
		}
	}
}
function pacify(){
	show_debug_message("Attempting to pacify...");
	var unit = global.selectedUnit;
	if unit<0{
		battle_manager.alarm[1]=10;
		return;
	}
	for (var i=0;i<array_length(global.targets);i++){
		var target = global.targets[i];
		if target<0 continue;
		var value = (unit.current[CHA]+unit.current[AGI]+50)/(50+target.current[CHA]+target.current[STR]);
	}
	with battle_manager
		alarm[1]=10;
}
function negotiate(){
	show_debug_message("Negotiating...");
	if global.targets[0]==noone
		global.targets[0]=global.enemies[|0];
	/*var inst = */instance_create_depth(150,45,-10000,obj_bribemenu);
	
}
function interrogate(){
	show_debug_message("Attempting to pacify...");
	var unit = global.selectedUnit;
	if unit<0{
		battle_manager.alarm[1]=10;
		return;
	}
	for (var i=0;i<array_length(global.targets);i++){
		var target = global.targets[i];
		if target<0 continue;
		var healt=target.current[HP]/target.base[HP];
 		var value = (unit.current[CHA]+(unit.current[STR]-target.current[STR])+50)/(50+target.current[CHA]+(target.current[STR]-unit.current[STR]));
		if value>healt{
			show_debug_message("Successful interrogation.");
			with battle_manager{
				currentMessage = target.title + " gave up intel.";
				enqueue(unit);
				alarm[1]=10;
			}
		}else{
			show_debug_message("Rogg failed.");
			with battle_manager{
				currentMessage = target.title + " resisted interrogation.";
				enqueue(unit);
				alarm[1]=10;
			}
		}
	}
	
}
function speak(){//should open speech menu I guess?
	pacify();
	negotiate();
	interrogate();
}

/* AOI TECH */

function burn(){
	var unit = global.selectedUnit;	
	with unit{
		current[MP] -= 4;
		//layer_sequence_headpos(unitSequence,atkStart);
		//state = ATTACK;
	}
	setParticle(2);//fire;
	for(var i = 0; i < array_length(global.targets); i++){
		show_debug_message(global.selectedUnit.title+" attacking "+global.targets[i].title+"#"+string(global.targets[i]));
		var xStep = (global.targets[i].x - unit.x )/4;
		var yStep = (global.targets[i].y - unit.y )/4;
		var partX = unit.x;
		var partY = unit.y;
		//part_type_direction(global.Particle1,)
		repeat(4)
		{
			partX+=xStep;
			partY+=yStep;
			part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
		}
		//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 10);
		elemAttack(2,.25,unit,global.targets[i]);
	 }
	with battle_manager{
		enqueue(unit); //was done by selector.  no longer
		battle_manager.alarm[1] = 10;	 
	}	 
}

function freeze(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets[0].title+"#"+string(global.targets[0]));
	checkForHit();
	setParticle(7);//ice
	var unit = global.selectedUnit;
	with unit{
		current[MP] -= 4;
	//	layer_sequence_headpos(unitSequence,atkStart);
	//	state = ATTACK;
	}
	var xStep = (global.targets[0].x - unit.x )/6;
	var yStep = (global.targets[0].y - unit.y )/6;
	var partX = unit.x;
	var partY = unit.y;
	repeat(6)
	{
		partX+=xStep;
		partY+=yStep;
		part_particles_create(global.P_System, partX, partY, global.Particle1, 1);
	}
	//part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	//if (unit.attackWillHit){
	elemAttack(9);//ice, default strength
	with battle_manager{//complete the turn
		enqueue(unit); //was done by selector.  no longer
		battle_manager.alarm[1] = 10;	 
	}
}

/* YUSUF TECH */


function embolden(){
	var unit = global.selectedUnit;
	setParticle(8);//Fighting energy
	with unit{
		current[MP] -= 2;
		layer_sequence_headpos(unitSequence,spcStart);
		state = SPECIAL;
	}
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 20);
	with(global.targets[0]){
		current[DEF]=ceil(current[DEF]*1.1);//hell yes
		current[STR]+=1.5;//HELL yes
		layer_sequence_headpos(unitSequence,hitStart);
		state = HEAL;
	}
	with battle_manager{
		enqueue(unit); //was done by selector.  no longer
		battle_manager.alarm[1] = 10;	 
	}
}
function detox(){
	var unit = global.selectedUnit;
	setParticle(8);//Fighting energy
	with unit{
		current[MP] -= 4;
		layer_sequence_headpos(unitSequence,spcStart);
		state = SPECIAL;
	}
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 8);
	with(global.targets[0]){
		if status[0]<0
			status[0]=0;
		else if status[0]>1
			status[0]=1;
		layer_sequence_headpos(unitSequence,hitStart);
		state = HEAL;
	}
	with battle_manager{
		enqueue(unit); //was done by selector.  no longer
		battle_manager.alarm[1] = 10;	 
	}
}

function balm(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 5;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 6);
	
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
	with battle_manager{
		enqueue(unit); //was done by selector.  no longer
		battle_manager.alarm[1] = 10;	 
	}
}

function intensiveCare(){
	var unit = global.selectedUnit;
	setParticle(0);
	unit.current[MP] -= 10;
	part_particles_create(global.P_System, unit.x, unit.y, global.Particle1, 7);
	/*if (global.targets[0].state == DEATH){
		part_particles_create(global.P_System, global.targets[0].x, global.targets[0].y, global.Particle1, 20);
			
		global.targets[0].current[HP] = round(global.targets[0].base[HP]/2);
		global.targets[0].state = IDLE;
		}*/
	revive_targets(0.5);
	
	with battle_manager{
		enqueue(unit);
		alarm[1] = 10;	 
	}
}
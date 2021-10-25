// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SoloTech(){
//seems like we can just ignore this
}

/* AOI TECH */

function burn(){
	var unit = global.selectedUnit;	
	unit.current[MP] -= 4;
	for(var i = 0; i < array_length(global.targets); i++){
		show_debug_message(global.selectedUnit.title+" attacking "+global.targets[i].title+"#"+string(global.targets[i]));
		checkForHit();
		if (unit.attackWillHit){
			with(global.targets[i]){ // (Energy) * (Fire) / 4
					incomingDamage = round(unit.current[@ WIS] * unit.current[@ STR]/4);
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
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
}

function freeze(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets[0].title+"#"+string(global.targets[0]));
	checkForHit();
	var unit = global.selectedUnit;
	unit.current[MP] -= 4;
	if (unit.attackWillHit){
		with(global.targets[0]){ // (Energy*1.25 + Fire/4) * (Ice/2 + Shadow/2)  ... / Earth * (Ice/2 + Shadow/2)?
				incomingDamage = round((unit.current[@ WIS]*1.25) + (unit.current[@ STR] / 4)* ((unit.current[@ AGI] / 2)+(unit.current[@ CHA] / 2)));
				show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
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
	//complete the turn?
}

/* YUSUF TECH */


function embolden(){
	for(var i = 0; i < ds_list_size(global.allies); i++){//probably gonna be called BY skill_selector, so take out the selection logic
		if (global.allies[|i].state != DEATH){
	        
			global.targets = [global.enemies[|i]];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
			}
	 	}		 
}

function balm(){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state != DEATH){
	        
			global.targets[i] = global.allies[|i];
			var inst = instance_create_layer(global.allies[|i].x, global.allies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;//do something different lol
			
			}
	 	}		 
}

function intensiveCare(){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state == DEATH){
	        
			global.targets = [global.allies[|i]];
			var inst = instance_create_layer(global.allies[|i].x, global.allies[|i].y,"UI_Targeting", itm_selector);
			inst.index = i;
			break;
			}
	 	}		 
}
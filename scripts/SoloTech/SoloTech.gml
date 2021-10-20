// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SoloTech(){
//seems like we can just ignore this
}

/* AOI TECH */

function burn(){
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = global.enemies[|i];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
			}
	 	}		 
}

function freeze(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets.title+"#"+string(global.targets));
	var unit = global.selectedUnit;
	if (unit.attackWillHit){
		with(global.targets){
				incomingDamage = unit.current[@ POW] ;
				show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
				state = HIT;
				layer_sequence_headpos(unitSequence,hitStart);
		}
	}
	else{
		with(global.targets){
			show_debug_message("OFFICIALLY MISSING");
			state = MISS;
			if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
			layer_sequence_headpos(unitSequence,missStart);
		}
	}
}

/* YUSUF TECH */


function embolden(){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = global.enemies[|i];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
			}
	 	}		 
}

function balm(){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state != DEATH){
	        
			global.targets = global.allies[|i];
			var inst = instance_create_layer(global.allies[|i].x, global.allies[|i].y,"UI_Targeting", itm_selector);
			inst.index = i;
			break;
			}
	 	}		 
}

function intensiveCare(){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].state == DEATH){
	        
			global.targets = global.allies[|i];
			var inst = instance_create_layer(global.allies[|i].x, global.allies[|i].y,"UI_Targeting", itm_selector);
			inst.index = i;
			break;
			}
	 	}		 
}
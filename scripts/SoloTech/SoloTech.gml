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
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = global.enemies[|i];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
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
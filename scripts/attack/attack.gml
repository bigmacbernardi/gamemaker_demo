// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack(){
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = global.enemies[|i];
			var inst = instance_create_layer(global.enemies[|i].x, global.enemies[|i].y,"UI_Targeting", atk_selector);
			inst.index = i;
			break;
			}
	 	}		 
}
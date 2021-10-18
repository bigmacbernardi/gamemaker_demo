/// @description On player interaction

if (!opened){
	//if (can add to inventory) {
	
	//obj_player.paused = true;
	//global.msc = 1000; 
	//global.dialogueLine = 1000; 
	//if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	//message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
	//}
	opened = true;
	global.chests[chestNo] = true;
}
	

//sprite_index = opened ? spr_chest_open : spr_chest_closed;
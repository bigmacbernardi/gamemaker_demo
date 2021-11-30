/// @description On player interaction

if (!opened){
	//if (can add to inventory) {
	
	//obj_player.paused = true;
	// 
	//global.dialogueLine = 1000; 
	//
	opened = true;
	global.chests[chestNo] = true;
	sprite_index = spr_chest_open;
	var thing = instance_create_depth(0,0,0,contents);
	if (thing==equippable) ds_list_add(global.equipment,thing);
	else{
		if instance_exists(thing){
			var it = instance_find(thing,0);
			it.depth++;
			it.numOwned++;
		}
		else{
			var thingle = instance_create_depth(0,0,1,thing);
			ds_list_add(global.inventory,thingle);	
		}
		
	}
	global.facechoice = 0;
	global.typer= 4;
	global.lineNo = 1000 + chestNo;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
}
	

//sprite_index = opened ? spr_chest_open : spr_chest_closed;
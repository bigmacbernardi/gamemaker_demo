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
	var thing = instance_create_depth(0,0,1,contents);
	if (object_get_parent(contents)==equippable)||
	(object_get_parent(object_get_parent(contents))==equippable) ds_list_add(global.equipment,thing);
	else if instance_exists(contents){
			show_debug_message("It's me, "+object_get_name(object_get_parent(contents)));
			var old = instance_find(contents,0);
			old.depth++;
			old.numOwned++;
			instance_destroy(thing);
		}
	else{
		ds_list_add(global.inventory,thing);	
	}
		
	global.facechoice = 0;
	global.typer= 4;
	global.lineNo = 1000 + chestNo;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
}
else obj_player.paused = false;

//sprite_index = opened ? spr_chest_open : spr_chest_closed;
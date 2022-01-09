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
	if (object_get_parent(contents)==equippable) or 
	(object_get_parent(object_get_parent(contents))==equippable){
		show_debug_message("It's a me, "+object_get_name(object_get_parent(contents)));
		var thing = instance_create_depth(0,0,1,contents);
		ds_list_add(global.equipment,thing);
	}
	else{
		var found = -1;
		for (var i = 0;i<ds_list_size(global.inventory);i++){
			show_debug_message("Checkin "+object_get_name( global.inventory[|i][0] ));
			if global.inventory[|i][0] == contents{
				show_debug_message("MATCH!");
				found = i;
				break;
			}
		}
		if found>-1{//instance_exists(contents){
			show_debug_message("It's me, "+object_get_name(object_get_parent(contents)));
			global.inventory[|found][1]++;
		}
		else{
			show_debug_message("It's a-me, "+object_get_name(object_get_parent(contents)));
			//var thing = instance_create_depth(0,0,1,contents);
			ds_list_add(global.inventory,[contents,1]);	
		}
	}
	
	global.facechoice = 0;//global.currentParty[0]+2;
	global.typer= 4;
	global.lineNo = 1000 + chestNo;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
}
else obj_player.paused = false;

//sprite_index = opened ? spr_chest_open : spr_chest_closed;
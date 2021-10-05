/// @description Checks story flags and acts accordingly.  Usually spawns dialogue.

/*if (global.story[|"dumb_test"]==true){
	global.dialogueLine=1;
	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam)+120,-6,obj_dialogue);
}
else{*/
	global.dialogueLine=0;
	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam)+120,-6,obj_dialogue);
/*	global.story[|"dumb_test"]==true
}*/
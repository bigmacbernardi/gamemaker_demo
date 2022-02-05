/// @description Check

if !global.flag[20]{//cannot freeze waterfall
	obj_player.paused=false;
}
else{
	obj_player.paused=true;//replace everything bellow with a special prompt to freeze
	global.lineNo = 100; 
	global.typer= 4;
	global.facechoice= 0;
	global.faceemotion= 0;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	var inst = instance_create_layer(camera_get_view_x(cam),10,layer,obj_dialoguer);
	//inst.target = id; //
}

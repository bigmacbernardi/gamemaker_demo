/// @description Insert description here
if lastPoints==-1{
	obj_player.paused = true;//redundant?
	global.lineNo = 200; 
	global.typer= 5;
	global.facechoice= 0;
	global.faceemotion= 0;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,"Instances",obj_dialoguer);
}
else{
	obj_player.paused = true;//redundant?
	global.lineNo = 201; 
	global.typer= 5;
	global.facechoice= 0;
	global.faceemotion= 0;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,"Instances",obj_dialoguer);	
}
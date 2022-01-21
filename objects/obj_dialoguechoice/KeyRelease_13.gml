/// @description Destroy box, reveal next line
if canchoose==2{
	global.facechoice = 0;
	global.typer = 5;
	global.lineNo = baseLine + mychoice;
	if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
	message = instance_create_layer(camera_get_view_x(cam),10,/*"Instances_2"*/layer,obj_dialoguer);
	instance_destroy();
}
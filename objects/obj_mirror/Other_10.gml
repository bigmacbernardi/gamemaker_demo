/// @description Show

obj_player.paused = true;
/*if global.currentParty[0]==YUSUF{
	global.lineNo = 6; 
}
else if  global.currentParty[0]==AOI{
	global.lineNo = 7; 
}
else*/global.lineNo = 8;
global.typer= 4;
global.facechoice= 0;
global.faceemotion= 0;
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);

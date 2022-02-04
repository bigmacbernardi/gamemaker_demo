/// @description Insert description here
obj_player.paused = true;
global.lineNo = 2; 
global.typer= 5;
global.facechoice= 0;
global.faceemotion= 0;
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances",obj_dialoguer);
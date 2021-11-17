/// @description On player interact
obj_player.paused = true;
global.msc = 2; 
global.dialogueLine = 2; //not using yet
global.typer= 4;
global.facechoice= 0;
global.faceemotion= 0;
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
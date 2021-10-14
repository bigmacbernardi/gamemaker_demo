/// @description Insert description here
// You can write your code in this editor
obj_player.paused = true;
global.msc = 2; //not using now just going from memory
global.dialogueLine = 2; //also not using
global.msg[0] = "Sign says!";//will be overwrote?
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
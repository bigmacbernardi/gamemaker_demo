/// @description Will check story flags and act accordingly.  Usually spawns dialogue.
/// @description On player interact
obj_player.paused = true;
global.typer= 5;//should produce sound?
global.facechoice= 1;
//global.dialogueLine = 3; //not using yet
if (global.flag[0]<2){
	global.msc = 3; 
	global.faceemotion= 2;
	global.flag[0]++;
}
else{
	global.msc = 0;//nonsense test line 
	global.faceemotion= 0;
}
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguer);
//	global.dialogueLine=0;
//	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam)+120,-6,obj_writer);

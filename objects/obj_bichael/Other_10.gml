/// @description Will check story flags and act accordingly.  Usually spawns dialogue.
/// @description On player interact
obj_player.paused = true;
global.typer= 5;//should produce sound
global.facechoice= 0;
//global.dialogueLine = 3; //not using yet
//if (global.flag[0]<2){
global.lineNo = nextMessage++; 
global.faceemotion= 2;
//global.flag[0]++;
//}
if nextMessage>32 nextMessage=30;
if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
message = instance_create_layer(camera_get_view_x(cam),10,"Instances",obj_dialoguer);
//	global.dialogueLine=0;
//	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam)+120,-6,obj_writer);
if (instance_exists(obj_dialoguechoice)) instance_destroy(obj_dialoguechoice);
var silly = instance_create_layer(camera_get_view_x(cam),10,"Instances_2",obj_dialoguechoice);
//silly.active = false;
if nextMessage==32 silly.optionString="Go to hell,Go to heaven,Fight";
else if nextMessage==30 silly.optionString="Be scared,Be scary,Be dull";
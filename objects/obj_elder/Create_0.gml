/// @description Override
event_inherited();
show_debug_message(global.flag[0]);
if (global.flag[0]!=1){
global.facechoice= 1;
global.faceemotion=0;
global.typer=5;
mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
alarm[0]=1;
}else obj_player.paused=false;

//if (global.flag[0]>0)instance_destroy(mydialoguer);

/// @description Override
event_inherited();
//if (!global.flag[0]){//why doesn't this work? if you run this check it just fails and pauses player
global.facechoice= 1;
global.faceemotion=0;
global.typer=5;
mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
global.flag[0]=1;
//}else obj_player.paused=false;

//if (global.flag[0]>0)instance_destroy(mydialoguer);

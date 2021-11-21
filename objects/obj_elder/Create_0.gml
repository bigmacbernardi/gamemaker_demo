/// @description Override
event_inherited();
//if (global.flag[0]==0){//why doesn't this work?  whole game freezes
global.facechoice= 1;
global.faceemotion=0;
global.typer=5;
mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
global.flag[0]=1;
//}
//should prevent respawn but w/e

//if (global.flag[0]>0)instance_destroy(mydialoguer);

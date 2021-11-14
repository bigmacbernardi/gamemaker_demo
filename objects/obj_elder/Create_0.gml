/// @description Override
event_inherited();
global.facechoice= 1;
global.faceemotion=0;
if (global.flag[0]==0)mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
//if (global.flag[0]>0)instance_destroy(mydialoguer);
else global.flag[0]++;//should prevent respawn but w/e
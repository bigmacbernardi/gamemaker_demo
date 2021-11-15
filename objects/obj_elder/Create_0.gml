/// @description Override
event_inherited();
global.facechoice= 1;
global.faceemotion=0;
//if (global.flag[0]==0){//why doesn't this work?  whole game freezes
mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
global.flag[0]=1;
//}
//should prevent respawn but w/e

//if (global.flag[0]>0)instance_destroy(mydialoguer);

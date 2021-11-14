/// @description Override
myinteract= 3;
global.msc= 9999;//meaningless
global.typer= 5;
global.facechoice= 0;
global.faceemotion= 0;
mydialoguer=instance_create_depth(0, 0,-1, obj_dialoguer);
//if (global.flag[0]>0)instance_destroy(mydialoguer);
global.flag[0]++;//should prevent respawn but w/e
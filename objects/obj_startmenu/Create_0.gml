/// @description Insert description here
//if variable_global_exists("spawnController")&&instance_exists(global.spawnController)
//	instance_destroy(global.spawnController);//because you died!	


x = 0;
y = 0;
camera_set_view_pos(cam,0,0);
options = ["PLAY GAME",
			"OPTIONS",
			"SOMETHING ELSE"];

options1 = ["NEW GAME",  "LOAD"];
options2 = ["SOUND","SCREEN","ACCESSIBILITY"];
options3 = ["CREDITS","NONDIAGETIC JUKEBOX (Locked)","??? (Minigames)"];
mode=0;
index=0;
idle=true;
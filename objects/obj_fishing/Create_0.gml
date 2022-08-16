/// @description Starts the minigame
//check returnRoom (obj_player coordinates if worldmap) to determine location
//location determines background image, effects color, and fish odds

part_color = c_blue;
hasBoat=false;
//instance_create_depth(200,600,0,obj_boat);
//unviersal behavior
obj_player.visible=0;
frameHasPassed=false;
score = 0;
baitRemain=8;//will interact with inventory instead
menuIndex = 0;
menuActive=true;
instance_create_depth(200,600,0,obj_fisher);
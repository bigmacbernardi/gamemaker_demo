/// @description The writer's "choicer."  Originally used for player choices; currently only really used for updating the writer as a step in the process.
alarm[1]= 3;
canchoose= 0;
add= camera_get_view_x(cam);
x= 89 + add;
y= 210 + camera_get_view_y(cam);
d= -1;
if(instance_exists(obj_dialoguer)) d= obj_dialoguer.side;
if(room != 179 && (obj_player.y > camera_get_view_y(cam) + 130 || d == 0))
    y-= 155;
mychoice= 0;
global.choice= -1;
chosen = 0;

script_execute(SCR_TEXTTYPE,4); //so ttexttype is set
show_debug_message("Speed be "+str(textspeed));
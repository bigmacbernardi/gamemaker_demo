/// @description Insert description here
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
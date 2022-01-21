/// @description Insert description here
alarm[1]= 3;
canchoose = 0;
add = camera_get_view_x(cam);
x= 89 + add;
y= 210 + camera_get_view_y(cam);
d= -1;
if(instance_exists(obj_dialoguer)) d= obj_dialoguer.side;
if(instance_exists(obj_writer)){
	x = obj_writer.x;
	y = obj_writer.y;
	//active = true;
}
//else active = false;
if(room != 179 && (obj_player.y > camera_get_view_y(cam) + 130 || d == 0))
    y-= 155;
mychoice= 0;
//global.choice= -1;//unnecessary I think
chosen = 0;
creator=obj_dialoguer;
script_execute(SCR_TEXTTYPE,4); //so ttexttype is set
textspeed=1;
options = ds_list_create();
alarm[2]=2;
show_debug_message("Speed be "+string(textspeed));
//obj_player.paused=true;//re
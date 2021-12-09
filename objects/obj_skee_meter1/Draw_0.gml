/// @description Draw meter

var drawY = 5 * camera_get_view_height(cam)/6;
draw_set_color(c_white);
draw_rectangle(minX,drawY,minX+((maxX-minX)/4),drawY+10,false);
draw_set_color(c_yellow);
draw_rectangle(minX+((maxX-minX)/4),drawY,minX+((maxX-minX)/2),drawY+10,false);
draw_set_color(c_orange);
draw_rectangle(minX+((maxX-minX)/2),drawY,minX+(3*((maxX-minX)/4)),drawY+10,false);
draw_set_color(c_red);
draw_rectangle(minX+(3*((maxX-minX)/4)),drawY,maxX,drawY+10,false);

var powX = ((maxX-minX)*(pow-400)/700)+minX;
draw_set_color(c_black);
draw_line(powX,drawY-4,powX,drawY+14);
if (!instance_exists(obj_skee_meter2))draw_sprite_stretched(spr_ball,0,ballX,drawY+40,75,75);
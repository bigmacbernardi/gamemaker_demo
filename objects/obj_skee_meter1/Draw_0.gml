/// @description Draw meter

var drawY = 5 * camera_get_view_height(cam)/6;
draw_set_color(c_red);
draw_rectangle(minX,drawY,maxX,drawY+10,false);

var powX = ((maxX-minX)*(pow-400)/700)+minX;
draw_set_color(c_black);
draw_line(powX,drawY-4,powX,drawY+14);
if (!instance_exists(obj_skee_meter2))draw_sprite_stretched(spr_ball,0,ballX,drawY+40,75,75);
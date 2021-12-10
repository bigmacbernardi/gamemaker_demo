/// @description Draw meter
var drawY = 5 * camera_get_view_height(cam)/6;
draw_set_color(c_red);
draw_line(ballX+52,40+drawY,ballX+52+powX,drawY+40+powY);
draw_sprite_stretched(spr_ball,0,ballX,drawY+40,104,104);
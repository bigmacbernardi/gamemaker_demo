/// @description Draw meter
var drawY = 5 * camera_get_view_height(cam)/6;
draw_set_color(c_red);
draw_line(ballX+36,drawY,ballX+36+powX,drawY+powY);
draw_sprite_stretched(spr_ball,0,ballX,drawY+40,75,75);
/// @description Draws name box
// You can write your code in this editor
var left_side = 3*camera_get_view_width(cam)/12;
var width = camera_get_view_width(cam)/3;
draw_sprite_stretched(spr_menu_temp,2,left_side,0,width,24);
draw_set_color(c_white);
draw_text_transformed(left_side+14,8,currentMessage,.6,.6,0);
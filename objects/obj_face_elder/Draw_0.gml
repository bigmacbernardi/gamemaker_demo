/// @description Insert description here
// You can write your code in this editor
var drawX = camera_get_view_x(cam) + 11;
var drawY = camera_get_view_y(cam) + camera_get_view_height(cam) - 85;
draw_sprite_ext(sprite_index,0,drawX,drawY,image_xscale,image_yscale,0,image_blend,image_alpha);

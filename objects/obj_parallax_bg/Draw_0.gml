/// @description Insert description here
// You can write your code in this editor
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _p = .5;
draw_sprite_tiled(bg_stars, 0, _camx*_p, _camy*_p);

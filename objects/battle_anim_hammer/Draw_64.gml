/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;
if keyboard_check(ord("V")){
	draw_text_transformed(xx -10,yy-7,"HP: "+string(current[HP])+"/"+string(base[HP]),.4,.4,0);
}

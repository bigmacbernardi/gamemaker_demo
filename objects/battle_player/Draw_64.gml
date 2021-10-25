/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;
var _mp = current[@ MP]/base[@ MP];
if (state != DEATH) //clean up some clutter
{
	draw_sprite(ui_mp,0,xx,yy-11);
	draw_sprite_part(ui_mp,1,0,0,mpBarWidth*_mp,mpBarHeight,xx,yy-11);
}


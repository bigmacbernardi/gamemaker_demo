/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
/*if (!instance_exists(obj_itemmenu)&&!instance_exists(obj_dualmenu)&&!instance_exists(obj_skillmenu)){
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
	else incomingDamage=0;
	if (incomingDamage>0){
		draw_set_color(c_white);
		draw_text_transformed(xx +10,yy+20,string(incomingDamage),.5,.5,0);
	}
}*/
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;

if keyboard_check(ord("V")){
	draw_set_color(c_red);
	draw_text_transformed(xx -10,yy-7,"AGI: "+string(current[@ AGI])+"/"+string(base[@ AGI]),.4,.4,0);
	draw_text_transformed(xx -10,yy,"CHA: "+string(current[@ CHA])+"/"+string(base[@ CHA]),.4,.4,0);
	draw_text_transformed(xx -10,yy+7,"DEX: "+string(current[@ DEX])+"/"+string(base[@ DEX]),.4,.4,0);
	draw_text_transformed(xx -10,yy+14,"WIS: "+string(current[@ WIS])+"/"+string(base[@ WIS]),.4,.4,0);
}

/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (!instance_exists(obj_itemmenu)&&!instance_exists(obj_dualmenu)&&!instance_exists(obj_skillmenu)&&!instance_exists(obj_submenu)&&!instance_exists(obj_bribemenu)){

	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var xx = (x-cx)*Display_ScaleX;
	var yy = (y-cy)*Display_ScaleY;


	var _hp = current[@ HP]/base[@ HP];
	if (state != DEATH) //clean up some clutter
	{
		draw_sprite(ui_mp,0,xx,yy-20);
		draw_sprite_part(ui_mp,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-20);
	}
	else incomingDamage=0;
	
}
event_inherited();

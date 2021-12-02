if (!instance_exists(obj_itemmenu)&&!instance_exists(obj_dualmenu)&&!instance_exists(obj_skillmenu)){
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var xx = (x-cx)*Display_ScaleX;
	var yy = (y-cy)*Display_ScaleY;


	var _hp = current[@ HP]/base[@ HP];
	if (state != DEATH) //clean up some clutter
	{
		draw_sprite(ui_hp,0,xx,yy-20);
		draw_sprite_part(ui_hp,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-20);
	}
	else incomingDamage=0;
	if (incomingDamage>0){
		draw_set_color(c_white);
		draw_text_transformed(xx +15,yy+30,string(max(0,incomingDamage-current[@ DEF])),.5,.5,0);
	}
}
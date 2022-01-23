var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;

if (!instance_exists(obj_itemmenu)&&!instance_exists(obj_dualmenu)&&!instance_exists(obj_skillmenu)&&!instance_exists(obj_submenu)){
	if (incomingDamage>0){
		draw_set_color(c_white);
		//draw_text_transformed(xx +15,yy+30,string(max(0,incomingDamage-current[@ DEF])),.5,.5,0);
		draw_text_transformed(xx +15,yy,string(max(0,incomingDamage-current[@ DEF])),.5,.5,0);
	}
	if (incomingHealage>0){
		draw_set_color(c_green);
		draw_text_transformed(xx +15,yy-5,string(max(0,incomingHealage)),.5,.5,0);
	}
	if (nastyDamage>0){
		draw_set_color(c_olive);
		draw_text_transformed(xx +15,yy+5,string(max(0,nastyDamage)),.5,.5,0);
	}
}
if keyboard_check(ord("V")){
	if isPlayer{
		if id == global.units[|0]{
		xx-=1;	
		}
		else if id == global.units[|1] or id == global.units[|3]{
		xx+=12;	
		}
	}
	draw_set_color(c_red);
	draw_text_transformed(xx -10,yy-35,"DEF: "+string(current[@ DEF])+"/"+string(base[@ DEF]),.4,.4,0);
	draw_text_transformed(xx -10,yy-28,"SPD: "+string(current[@ SPD])+"/"+string(base[@ SPD]),.4,.4,0);
	draw_text_transformed(xx -10,yy-21,"STR: "+string(current[@ STR])+"/"+string(base[@ STR]),.4,.4,0);
	draw_text_transformed(xx -10,yy-14,"ACC: "+string(current[ACC])+"/"+string(base[ACC]),.4,.4,0);
}
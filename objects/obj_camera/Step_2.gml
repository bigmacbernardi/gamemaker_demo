/// @description Insert description here
// You can write your code in this editor
/// @description 
camera_set_view_size(cam,current_width,current_height);

if(instance_exists(battle_manager))
{
	var _x = clamp(battle_manager.x-current_width/2,0,room_width-current_width);
	var _y = clamp(battle_manager.y-current_height/2,0,room_height-current_height);
	
	var _cur_x = camera_get_view_x(cam);
	var _cur_y = camera_get_view_y(cam);
	
	var _spd =.1;
	camera_set_view_pos(cam,
											lerp(_cur_x,_x,_spd),
											lerp(_cur_y,_y,_spd));
}
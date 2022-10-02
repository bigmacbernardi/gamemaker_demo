/// @description Replace warp with pan effect
if room != T1MoriHouse  room_goto(T1MoriHouse);
resetParty = global.currentParty;
global.currentParty = [MORI,noone,noone,noone];
with obj_player{
	set_sprites();	
}
camera_set_view_target(cam,noone);
obj_player.paused = true;
//camera_set_view_pos(cam,20,10);
state = 0;
draw_set_alpha(1);
progress = 0;
//obj_player.x = camera_get_view_x(cam)+5;
//obj_player.y = camera_get_view_y(cam)+30;
bag_x = obj_player.x - 50;
bag_y = obj_player.y+obj_player.sprite_height;
/// @description Get set up
resetParty = global.currentParty;
global.currentParty = [YUSUF,noone,noone,noone];
with obj_player{
	set_sprites();	
}
camera_set_view_target(cam,noone);
obj_player.paused = true;
camera_set_view_pos(cam,20,10);
state = 0;
draw_set_alpha(1);
progress = 0;
obj_player.x = 5;
obj_player.y = 30;
var bag_x = obj_player.x - 50;
var bag_y = obj_player.y+obj_player.height;


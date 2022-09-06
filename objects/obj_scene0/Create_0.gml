/// @description Get set up
resetParty = global.currentParty;
global.currentParty = [YUSUF,noone,noone,noone];
with obj_player{
	set_sprites();	
}
if room != T1YusufRoom{
	room_goto(T1YusufRoom);
	obj_player.x = 93;
	obj_player.y = 311;
	var sprs = [obj_player.back_sprites,obj_player.right_sprites,obj_player.left_sprites,obj_player.front_sprites];
	with obj_maninthemirror{
		sprite_index = sprs[obj_player.facing / 2 - 1][obj_player.locomode];	
	}
}
camera_set_view_target(cam,noone);
obj_player.paused = true;
//camera_set_view_pos(cam,20,10);
state = 0;
draw_set_alpha(1);
progress = 0;
//obj_player.x = camera_get_view_x(cam)+5;
//obj_player.y = camera_get_view_y(cam)+30;
bag_x = obj_player.x - 10;
bag_y = obj_player.y+obj_player.sprite_height;


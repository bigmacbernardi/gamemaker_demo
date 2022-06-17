/// @description Insert description here
var bag_x = obj_player.x;
var bag_y = obj_player.y+obj_player.height;
switch (state){
	case 0:
			//draw_set_alpha(progress/room_speed);
			draw_set_color(c_black);
			draw_set_alpha(1 - progress/room_speed);
			draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),false);
			state = 1;
	case 1:
			draw_set_alpha(1);
			draw_sprite(spr_medbag,0,bag_x,bag_y);
			break;
	case 2:
			break;
	case 3:
			break;
	case 4:
			break;
	case 5:
			break;
	default:
		instance_destroy();
}
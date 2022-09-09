/// @description Insert description here
switch (state){
	case 0:
			//draw_set_alpha(progress/room_speed);
			draw_set_color(c_black);
			draw_set_alpha(1 - progress/room_speed);
			draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),false);
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
	case 6:
	case 7:
	case 8:
			draw_set_alpha(1);
			if !instance_exists(obj_nameentry) draw_sprite(spr_medbag,0,bag_x,bag_y);
			break;
	case 9:
	default: 
			break;
}
/// @description Insert description here
switch (state){
	case 0:
			//draw_set_alpha(progress/room_speed);
			draw_set_color(c_black);
			draw_set_alpha(1 - progress/room_speed);
			draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),false);
}
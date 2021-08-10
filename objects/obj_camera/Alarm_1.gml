/// @description Insert description here
// You can write your code in this editor
/// @description resize_window && app surface (when not in fullscreen)
surface_resize(application_surface,
							 current_width*sub_pixel_scale,
							 current_height*sub_pixel_scale);
display_set_gui_size(current_width*gui_scale,
									   current_height*gui_scale);

if(!window_get_fullscreen())
{	//We aren't in full screen, 
	window_set_size(current_width*window_scale,current_height*window_scale);
	center_window;
}

ui_element_update_positions();	




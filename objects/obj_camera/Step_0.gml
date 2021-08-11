/// @description Insert description here
// You can write your code in this editor
/// @description Zoom GUI / Detectc Fullscreen Switch
var _full=window_get_fullscreen();
if(is_full_screen != _full)
{
	//instance_create_depth(0,0,-1000,obj_screen_fade);
	is_full_screen=_full;
	if(!is_full_screen)
	{	//Switching back from full screen.  Adjust window size.
		
		resize_window;
	}
}

if(!mouse_wheel_up() && !mouse_wheel_down()) exit;

//gui_scale+=(mouse_wheel_down()-mouse_wheel_up())*.25;
//gui_scale=clamp(gui_scale,1,window_scale);

//display_set_gui_size(current_width*gui_scale,
//									   current_height*gui_scale);
//ui_element_update_positions();

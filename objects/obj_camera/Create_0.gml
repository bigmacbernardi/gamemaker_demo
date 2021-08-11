/// @description Insert description here
// You can write your code in this editor
/// @description 
#macro cam view_camera[0]
#macro base_width 400
#macro base_height 225
current_width = base_width
current_height = base_height

#macro center_window alarm[0]=1
#macro resize_window alarm[1]=1 

#macro resize_app_surface surface_resize(application_surface,current_width*sub_pixel_scale,current_height*sub_pixel_scale)

window_scale=3;
gui_scale=1;
sub_pixel_scale=window_scale;
is_full_screen=window_get_fullscreen();

//instance_create_depth(0,0,-1000,obj_screen_fade);
resize_app_surface; 
resize_window;
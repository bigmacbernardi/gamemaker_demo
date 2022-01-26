/// @description Print the level and arrows and crap
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(cam)+20,camera_get_view_y(cam)+30,camera_get_view_x(cam)+100,camera_get_view_y(cam)+70,false);
draw_set_color(c_white);
draw_text_transformed(camera_get_view_x(cam)+36,camera_get_view_y(cam)+35,"Level",.5,.5,0);
draw_text(camera_get_view_x(cam)+40,camera_get_view_y(cam)+44,level);
draw_text_transformed(camera_get_view_x(cam)+30,camera_get_view_y(cam)+60,"Max level: "+string(array_length(lvBreaks)),.4,.4,0);
/// @description Print the level and arrows and crap
draw_set_font(Roses);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(cam)+20,camera_get_view_y(cam)+30,camera_get_view_x(cam)+100,camera_get_view_y(cam)+70,false);
draw_set_color(c_white);
draw_text_transformed(camera_get_view_x(cam)+47,camera_get_view_y(cam)+34,"Level",.5,.5,0);
draw_text(camera_get_view_x(cam)+49,camera_get_view_y(cam)+44,level);
draw_text_transformed(camera_get_view_x(cam)+31,camera_get_view_y(cam)+61,"Max level: "+string(array_length(lvBreaks)),.4,.4,0);
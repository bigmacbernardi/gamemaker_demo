/// @description Print the level and arrows and crap
draw_set_font(Roses);
draw_set_color(c_black);
var drawY = camera_get_view_y(cam)+30;
draw_rectangle(camera_get_view_x(cam)+20,drawY,camera_get_view_x(cam)+100,camera_get_view_y(cam)+70,false);
drawY+=4;
for (var i = 0; i<array_length(options);i++){
	draw_set_color(i==currentIndex?c_white:c_gray);	
	draw_text_transformed(camera_get_view_x(cam)+47,drawY,options[i],.5,.5,0);
	drawY+=8;
}
draw_text(camera_get_view_x(cam)+49,camera_get_view_y(cam)+44,level);
draw_text_transformed(camera_get_view_x(cam)+31,drawY+17,"Max level: "+string(array_length(lvBreaks)),.4,.4,0);
/// @description Print the level and arrows and crap
draw_set_font(Roses);
draw_set_color(c_aqua);
var drawY = camera_get_view_y(cam)+30;
draw_rectangle(camera_get_view_x(cam)+60,drawY,camera_get_view_x(cam)+246,drawY+110,false);
drawY+=4;
for (var i = scrollLevel; i<min(scrollLevel+10,array_length(names)-1);i++){
	draw_set_color(i==currentIndex?c_blue:c_black);	
	draw_text_transformed(camera_get_view_x(cam)+67,drawY,names[i],.45,.45,0);
	drawY+=11;
}

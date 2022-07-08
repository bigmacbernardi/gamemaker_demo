/// @description Print the level and arrows and crap
draw_set_font(Roses);
draw_set_color(c_fuchsia);
var drawY = camera_get_view_y(cam)+30;
draw_rectangle(camera_get_view_x(cam)+20,drawY,camera_get_view_x(cam)+200,drawY+110,false);
drawY+=4;
for (var i = scrollLevel; i<min(scrollLevel+10,array_length(names)-1);i++){
	draw_set_color(i==currentIndex?c_white:c_black);	
	draw_text_transformed(camera_get_view_x(cam)+28,drawY,names[i],.4,.4,0);
	drawY+=11;
}

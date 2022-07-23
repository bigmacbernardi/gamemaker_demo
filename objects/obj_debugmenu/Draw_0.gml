/// @description Print the level and arrows and crap
draw_set_font(Roses);
draw_set_color(c_black);
var drawY = camera_get_view_y(cam)+30;
draw_rectangle(camera_get_view_x(cam)+20,drawY,camera_get_view_x(cam)+200,drawY+(array_length(options)*12),false);
drawY+=4;
for (var i = 0; i<array_length(options);i++){
	draw_set_color(i==currentIndex?c_white:c_gray);	
	draw_text_transformed(camera_get_view_x(cam)+47,drawY,options[i],.5,.5,0);
	if options[i]=="LO-CLIP"
		draw_text_transformed(camera_get_view_x(cam)+87,drawY,noClipOn?"On":"Off",.5,.5,0);
	drawY+=12;
}

/// @description Insert description here
// You can write your code in this editor
draw_self();
if (activated){
	draw_set_font(Roses);
	draw_set_color(c_black);
	var drawY = camera_get_view_y(cam)+30;
	draw_rectangle(camera_get_view_x(cam)+20,drawY,camera_get_view_x(cam)+200,drawY+48,false);
	drawY+=4;
	draw_set_color(0==selected?c_white:c_gray);	
		
	draw_text_transformed(camera_get_view_x(cam)+47,drawY,"Buy",.5,.5,0);
	drawY+=8;
	draw_set_color(1==selected?c_white:c_gray);	
	draw_text_transformed(camera_get_view_x(cam)+47,drawY,"Sell",.5,.5,0);
	drawY+=8
	draw_set_color(2==selected?c_white:c_gray);	
	if chattable draw_text_transformed(camera_get_view_x(cam)+47,drawY,"Chat",.5,.5,0);
	drawY+=8;
	draw_set_color(3==selected?c_white:c_gray);	
	draw_text_transformed(camera_get_view_x(cam)+47,drawY,"Exit",.5,.5,0);
}

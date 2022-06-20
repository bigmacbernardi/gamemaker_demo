/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_color(c_navy);
draw_rectangle(camera_get_view_x(cam),camera_get_view_y(cam),display_get_gui_width(), display_get_gui_height(),false);
if naming_whom<0 black = true;
else if defaulted{
	draw_set_color(c_white);
	var drawX = 10 + camera_get_view_x(cam);
	var drawY = 35 + camera_get_view_y(cam);
	//for (var i = 0 ; i< array_length(characters);i++){
	draw_text(drawX,drawY,name_so_far);
	//}
	drawX = 10 + camera_get_view_x(cam);
	drawY +=15;
	if (black_alpha > 0) black_alpha -= .05;
	for (var i = 0 ; i< array_length(characters);i++){
		draw_set_color(i==index2?c_white:c_yellow);
		draw_text(drawX,drawY,characters[i]);
		drawX += 20;
		if i%10 == 9 {
			drawX = 10 + camera_get_view_x(cam);
			drawY += 15;
		}
	}
	if index2== array_length(characters){
		draw_set_color(c_green);
		draw_text(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),camera_get_view_y(cam)+(camera_get_view_height(cam)/2),"SUMIT");
	}
	
}
if black {
	if black_alpha > 0 {
			draw_set_alpha(black_alpha);
			draw_set_color(c_black);
			draw_rectangle(camera_get_view_x(cam),camera_get_view_y(cam),display_get_gui_width(), display_get_gui_height(),false);
			state = 1;
	}
	else black = false;
}
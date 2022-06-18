/// @description Insert description here
// You can write your code in this editor
if naming_whom<0 black = true;
else if defaulted{
	draw_set_alpha(1);
	var drawX = 10;
	for (var i = 0 ; i< array_length(characters);i++){
		draw_text(drawX,drawY,characters[i]);
	}
	drawX = 10;
	var drawY = 50;
	if (black_alpha > 0) black_alpha -= .05;
	for (var i = 0 ; i< array_length(characters);i++){
		draw_text(drawX,drawY,characters[i]);
	}
}
if black {
	if black_alpha > 0 {
			draw_set_alpha(black_alpha);
			draw_set_color(c_black);
			draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),false);
			state = 1;
	}
	else black = false;
}
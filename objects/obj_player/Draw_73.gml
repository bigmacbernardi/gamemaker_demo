/// @description Debug stuff
if keyboard_check(ord("V")){
	draw_set_colour(c_red);
	draw_rectangle(round(eye_x1), round(eye_y1), round(eye_x2), round(eye_y2),true);
}
draw_text(5,5,stepsTaken);
/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
if instance_exists(obj_ball)
	draw_text(x+40,y,"Depth to beat: "+string(obj_ball.baseDepth-(obj_skeevidingline.y-50)));
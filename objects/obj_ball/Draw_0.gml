/// @description Insert description here
// You can write your code in this editor
draw_self();
if mode==1{
	draw_set_color(make_color_rgb(200,150,0));
	draw_rectangle(obj_skeeball.leftX,skeevider+1,obj_skeeball.rightX,camera_get_view_height(cam),false);
}
draw_set_color(c_black);
draw_text(500,camera_get_view_height(cam)-50,"Balls depth: "+string(obj_ball.depth));
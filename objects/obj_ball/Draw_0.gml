/// @description Insert description here
// You can write your code in this editor
draw_self();
if mode==1{
	draw_set_color(make_color_rgb(200,150,0));
	draw_rectangle(obj_skeeball.leftX,441,obj_skeeball.rightX,camera_get_view_height(cam),false);
}
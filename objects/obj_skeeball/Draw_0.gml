/// @description Insert description here
// You can write your code in this editor
draw_set_color(make_color_rgb(200,150,0));//base
draw_rectangle(0,0,camera_get_view_width(cam),camera_get_view_height(cam),false);

draw_set_color(c_maroon);//sides
draw_rectangle(0,0,leftX,camera_get_view_height(cam),false);
draw_rectangle(rightX,0,camera_get_view_width(cam),camera_get_view_height(cam),false);

draw_set_color(c_black);
var dividingLine =  obj_skeevidingline.y;
draw_line(0,dividingLine,camera_get_view_width(cam),dividingLine);
//draw_circle((rightX-leftX)/2+leftX,dividingLine/2,dividingLine/2,true);
//draw_circle((rightX-leftX)/2+leftX,dividingLine/2,floor(dividingLine*(5/22)),true);
draw_text(10,camera_get_view_height(cam)-50,"Balls remaining: "+string(ballsRemain));
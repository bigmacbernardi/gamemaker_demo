/// @description This is for the "converse" mechanic
var inst = instance_create_layer(camera_get_view_x(cam)+40,camera_get_view_y(cam)+40,"UI_Base",obj_battle_convo);
var mytle = title;
with inst{
	ds_list_add(lines,mytle+": ...");
	allowedToGo = true;
}
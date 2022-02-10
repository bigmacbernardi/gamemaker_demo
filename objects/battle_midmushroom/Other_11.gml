/// @description Should cancel
var inst = instance_create_layer(camera_get_view_x(cam)+80,camera_get_view_y(cam)+75,"UI_Base",obj_battle_convo);
var mytle = title;
var speaker = global.selectedUnit; 
with inst{
	ds_list_add(lines,mytle+":  Don't touch me assbag");				//line 0
	ds_list_add(lines,"The "+string_lower(mytle)+" doesn't want to speak to you, "+speaker.title);		//line 6
	ds_list_add(lines,"{cancel}");									//line 9
	allowedToGo = true;													//END: 10
}



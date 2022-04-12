/// @description Normal dialogue
var inst = instance_create_layer(camera_get_view_x(cam)+80,camera_get_view_y(cam)+75,"UI_Base",obj_battle_convo);
var mytle = title;
var speaker = global.selectedUnit; 
with inst{
	ds_list_add(lines,mytle+":  Grr grr hostile hostile");				//line 0
	ds_list_add(lines,mytle+":  Go thank a tree you ingulous ingrate");	//line 1
	ds_list_add(lines,"* Do as he says * Do as you please * Do nothing ");//line 2
	ds_list_add(lines,speaker.title+":  A tree I thanketh thee=>6");	//line 3
	ds_list_add(lines,speaker.title+":  I do what I want, ok?=>8");		//line 4
	ds_list_add(lines,speaker.title+":  ...=>9");							//line 5
	ds_list_add(lines,"The "+string_lower(mytle)+" is pleased.");		//line 6
	ds_list_add(lines,mytle+":  You may pass lol=>10");					//line 7
	ds_list_add(lines,mytle+":  Oh ok=>10");							//line 8
	ds_list_add(lines,mytle+":  ...");									//line 9
	allowedToGo = true;													//END: 10
}

price=10;
electrum_prize=[obj_ether,100];
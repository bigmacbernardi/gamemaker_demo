//think of the possibilitink
var inst = instance_create_layer(camera_get_view_x(cam)+80,camera_get_view_y(cam)+75,"UI_Base",obj_battle_convo);
var mytle = title;
var unit = global.selectedUnit;
if unit<=0{
	with inst{
		ds_list_add(lines,"A voice calls out for "+mytle+"!");
		ds_list_add(lines,mytle+": Who said that??");
		allowedToGo = true;
	}
}
else if unit == teammate{
	with inst{
		ds_list_add(lines,unit.title+": Oh hi "+mytle+"!");
		ds_list_add(lines,mytle+": Hi "+unit.title+".");
		allowedToGo = true;
	}	
}
else if unit.title == mytle {
	with inst{
		ds_list_add(lines,unit.title+": Hey "+mytle+"\n"+mytle+": hey "+unit.title);
		allowedToGo = true;
	}
}
else if unit.title == mytle {
	with inst{
		ds_list_add(lines,mytle+": Idku"+unit.title);
		allowedToGo = true;
	}
}
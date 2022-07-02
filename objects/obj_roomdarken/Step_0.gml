/// @description Insert description here
// You can write your code in this editor
if fade>0 and fade < 100 and not leaving{
	fade++;
	image_alpha += 0.01;
}
else if leaving{
	if fade == 100 instance_destroy();
	else{
		fade++;
		image_alpha -= 0.01;
	}
}

if fade == 100 {
	if !instance_exists(obj_event){
		var inst = instance_create_depth(0,0,0,obj_event);
		inst.action = associatedAction;
		fade++;
	}
	else inst.action = associatedAction;
}
else if fade==101 and !instance_exists(obj_event){
	fade = 0;
	leaving = true;
}
/// @description Insert description here
// You can write your code in this editor
if fade < 100 and not leaving{
	fade+=2;
	image_alpha += 0.02;
}
else if leaving{
	if fade == 100{
		show_debug_message("Bye bye!");
		instance_destroy();
	}
	else{
		fade++;
		image_alpha -= 0.01;
	}
}
else if fade == 100 {
	show_debug_message("Executing!");
	if !instance_exists(obj_event){
		var inst = instance_create_depth(0,0,0,obj_event);
		inst.action = associatedAction;
		fade++;
	}
	else inst.action = associatedAction;
}
else if fade==101 and !instance_exists(obj_event){
	show_debug_message("Reversing!");
	fade = 0;
	leaving = true;
}
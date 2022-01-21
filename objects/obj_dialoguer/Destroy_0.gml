/// @description Cleanup
show_debug_message("DIALOGUER SMASH");
if !instance_exists(obj_face) {
    with(obj_face) instance_destroy();//what??
	obj_player.alarm[0] = room_speed/10;
}
if instance_exists(obj_dialoguechoice){
	with obj_dialoguechoice alarm[3] = room_speed/10;	
}
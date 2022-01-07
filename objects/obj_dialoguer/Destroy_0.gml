/// @description Cleanup
if !instance_exists(obj_face) {
    with(obj_face) instance_destroy();
	obj_player.alarm[0] = room_speed/10;
}
if instance_exists(obj_dialoguechoice){
	with obj_dialoguechoice canchoose = 1;	
}
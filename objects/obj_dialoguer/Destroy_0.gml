/// @description Cleanup
if !instance_exists(obj_face) {
    with(obj_face) instance_destroy();
	obj_player.alarm[0] = room_speed/10;
}
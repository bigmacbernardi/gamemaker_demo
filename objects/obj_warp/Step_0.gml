/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, obj_player) && !instance_exists(obj_transition)
	{
	var inst = instance_create_depth(0, 0, -9999, obj_transition)
	inst.target_x = target_x
	inst.target_y = target_y
	inst.target_rm = target_rm

	}
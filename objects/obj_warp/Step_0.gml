/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, obj_player) && !instance_exists(obj_rm_transition)
	{
	var tx= target_x;
	var ty= target_y;
	with obj_player{
		paused = true;// to mitigate escapes
		eye_x1=tx-(sprite_width/2);
		eye_x2=tx+(sprite_width/2);
		eye_y1=ty-sprite_height;
		eye_y2=ty;//to prevent interaction box from detaching
	}
	var inst = instance_create_depth(0, 0, -9999, obj_rm_transition)
	inst.target_x = target_x
	inst.target_y = target_y
	inst.target_rm = target_rm

	}
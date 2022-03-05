/// @description Insert description here
// You can write your code in this editor
var visibility_range = 50;
if ascending
{
	if ++level == 159 ascending = false;
	
}
else {
	if --level == 0 ascending = true;
		
}

if (distance_to_object(obj_player)<visibility_range){
	image_alpha=1-max(0,(distance_to_object(obj_player)-16)/(visibility_range-16));
}

sprite_set_offset(sprite_index, 0, 0 - floor(level/40));
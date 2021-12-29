/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if ascending
{
	if ++level == 1499 ascending = false;
	
}
else {
	if --level == 0 ascending = true;
		
}

if (distance_to_object(obj_player)<range){
	image_alpha=1-max(0,(distance_to_object(obj_player)-40)/(range-40));
	if (distance_to_object(obj_player)<(range-30)) activated = true;//was: if (image_alpha>=.2) activated = true;
}
if activated{
	if (obj_player.x > x){
		if (image_xscale==-1){
			image_xscale = 1;
			x-=sprite_width;//x-=sprite_width;
		}
		x+=1;
	}
	else if (obj_player.x < x){
		if (image_xscale==1) x+=sprite_width;
		else x-=1;
		image_xscale = -1;
		
	}
	if (obj_player.y > y) y+=1;
	else if (obj_player.y < y) y-=1;
}
sprite_set_offset(sprite_index, 0, 0 - floor(level/500));
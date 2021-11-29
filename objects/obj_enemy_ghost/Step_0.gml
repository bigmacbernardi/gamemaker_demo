/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (distance_to_object(obj_player) < 200)&&!obj_player.paused{
	if (distance_to_object(obj_player)<100)obj_player.image_blend=c_white;//for funsies
	if (obj_player.x > x){
		if (image_xscale==-1){
			image_xscale = 1;
			x-=sprite_width;//x-=sprite_width;
		}
		x+=0.66;
	}
	else if (obj_player.x < x){
		if (image_xscale==1) x+=sprite_width;
		else x-=0.66;
		image_xscale = -1;
		
	}
	if (obj_player.y > y) y+=0.75;
	else if (obj_player.y < y) y-=0.75;
}
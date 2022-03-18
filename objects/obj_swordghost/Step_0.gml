/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (distance_to_object(obj_player)<visibility_range)
	image_alpha=1-max(0,(distance_to_object(obj_player)-40)/(visibility_range-40));

if graceRemaining<=0{
	/*if ascending
	{
		if ++level == 199 ascending = false;
	
	}
	else {
		if --level == 0 ascending = true;
		
	}*/

	if (distance_to_object(obj_player)<activation_range){
		activated = true;
		ascending = true;
		sprite_index = spr_g_g_g_ghostsword_rise;
	}
if activated &&!obj_player.paused{
	if sprite_index ==spr_g_g_g_ghostsword_rise and --countdown>0{
		
		ascending = false;
		sprite_index = spr_g_g_g_ghostsword;
	}
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
	if ((obj_player.y-obj_player.sprite_height) > y) y++;
	else if ((obj_player.y-obj_player.sprite_height) < y) y--;
}
else if !obj_player.paused{// patrolling
	if forward{
		if horizontalPatrol{
			x+=0.5;
			if (x>=maxi) forward=false;
		}
		else{
			y+=0.5;
			if (y>= maxi) forward=false;
		}
	}
	else{
		if horizontalPatrol{
			x-=0.5;
			if (x<=mini) forward=true;
		}
		else{
			y-=0.5;
			if (y <= mini) forward=true;
		}
	}
}
}
//sprite_set_offset(sprite_index, 0, 0 - floor(level/50));
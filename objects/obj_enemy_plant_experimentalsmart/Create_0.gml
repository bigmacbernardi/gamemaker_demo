/// @description Despawns if fight previously entered
if array_length(spawn_controller1.scriptedFights[fightNo])==0 
	instance_destroy(); //should probably just prevent from spawning
countdown = 0;
graceRemaining = 0;
mode = real(distance_to_object(obj_player)<20);//0: not chasing.  1: chasing.
if global.fightNo==fightNo{
	global.fightNo=-6;
	graceRemaining = 40;
}
if secondBound==0 secondBound = room_width;
if lowerBound==0 lowerBound = room_height;
function pursue(step){
	var target_x=x;
	var target_y=y;
	switch(currentDirection){
		case 0:// moving right
			sprite_index = spr_enemyplant_right;
			image_xscale = 1;
			target_x+=step;
			break;
		case 1:// moving down
			sprite_index = spr_enemyplant_front;
			target_y+=step;
			break;
		case 2://moving left
			sprite_index = spr_enemyplant_right;
			image_xscale = -1;
			target_x-=step;
			break;
		case 3://moving up
			sprite_index = spr_enemyplant_back;
			target_y-=step;
			break;	
	}
	if place_meeting(target_x,target_y,obj_wall)
		return false;
	else{
		x = target_x;
		y = target_y;
		return true;	
	}
}
image_blend=c_orange;
amt=0;
/// @description Handles collisions and warp
//movement
if graceRemaining<=0 and instance_exists(obj_player) and !obj_player.paused {
	if mode==0{
		var target_x=x;
		var target_y=y;
		switch(currentDirection){
			case 0:// moving right
				if x>=secondBound{
					currentDirection = 2;
					sprite_index = spr_enemyplant_right;
					image_xscale = -1;
				}
				else{		
					if image_speed>0 image_speed-=0.1;
					else image_speed=1;
					target_x=x+image_speed;
				}
				break;
			case 1:// moving down
	
				if y>=lowerBound{
					currentDirection = 3;
					sprite_index = spr_enemyplant_back;
				}
				else {		
					if image_speed>0 image_speed-=0.1;
					else image_speed=1;
					target_y=y+image_speed;
				}
				break;
			case 2://moving left
	
				if x<=firstBound{
					currentDirection = 0;
					sprite_index = spr_enemyplant_right;
					image_xscale = 1;
				}
				else {		
					if image_speed>0 image_speed-=0.1;
					else image_speed=1;
					target_x=x-image_speed;
				}
				break;
			case 3://moving up
				if y<=upperBound{
					currentDirection = 1;
					sprite_index = spr_enemyplant_front;
				}
				else {		
					if image_speed>0 image_speed-=0.1;
					else image_speed=1;
					target_y=y-image_speed;
				}
				break;	
		}
		if place_meeting(target_x,target_y,obj_wall){
			currentDirection = irandom(3);//just to mix things up
			switch(currentDirection){
				case 0:// moving right
					currentDirection = 2;
					sprite_index = spr_enemyplant_right;
					image_xscale = -1;
					break;
				case 1:// moving down
					currentDirection = 3;
					sprite_index = spr_enemyplant_back;
					break;
				case 2://moving left
					currentDirection = 0;
					sprite_index = spr_enemyplant_right;
					image_xscale = 1;
					break;
				case 3://moving up
					currentDirection = 1;
					sprite_index = spr_enemyplant_front;
					break;	
			}
		}else{
			x = target_x;
			y = target_y;
		}


	mode = real(distance_to_object(obj_player)<40);
	}
	else{//chasing
		image_speed=1.3;
		var x_gap = (x/*+sprite_width/2*/)-obj_player.x;
		var y_gap = (y/*+sprite_height*/)-obj_player.y;
		var next_directions = [];
		if abs(x_gap)>abs(y_gap){
			currentDirection = (x_gap<0)?0:2;
			next_directions = [(y_gap<0)?1:3,(x_gap<0)?2:0,(y_gap<0)?3:1];
		}
		else{
			currentDirection = (y_gap<0)?1:3;
			next_directions = [(x_gap<0)?0:2,(x_gap<0)?2:0,(y_gap<0)?3:1];
		}
		var big_step = 2+keyboard_check(vk_shift);
		if !pursue(big_step){
			if !pursue(1){
				currentDirection=next_directions[0];
				if !pursue(big_step){
					currentDirection=next_directions[1];
					if !pursue(big_step){
						currentDirection=next_directions[2];
						if !pursue(big_step) show_debug_message("Help I'm stuck mummy!");
					}
				}
			}
		}
		mode = real(distance_to_object(obj_player)<200);	
	}
	
	// Usual enemy code
	if place_meeting(x, y, obj_player) {
		show_debug_message("PLANT COMIN");
		if !instance_exists(obj_battle_transition)
		{
			obj_player.paused=true;
			global.returnRoom = room;
			global.fightNo = fightNo;
			global.foesToSpawn = global.spawnController.scriptedFights[fightNo];
			//spawn_controller1.scriptedFights[fightNo] = true;
			//spawn_controller1.scriptedFights[fightNo] = [];//updated at battle end
			var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
			inst.target_rm = global.battleRoom;
		}
	}
}
else if graceRemaining>0 and !(--graceRemaining%5) visible = !visible;
depth = -y;//depth can adjust for moving enemies
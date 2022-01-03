/// @description Handles collisions and warp
//movement
if graceRemaining<=0 {
	if countdown>0 countdown--;
	else switch(currentDirection){
		case 0:// moving right
			if x>=secondBound{
				countdown=70;
				currentDirection = 2;
			}
			else x++;
			break;
		case 1:// moving down
	
			if y>=secondBound{
				countdown=70;
				currentDirection = 3;
			}
			else y++;
			break;
		case 2://moving left
	
			if x<=firstBound{
				countdown=70;
				currentDirection = 0;
			}
			else x--;
			break;
		case 3://moving up
			if y<=firstBound{
				countdown=70;
				currentDirection = 1;
			}
			else y--;
			break;	
	}


	// Usual enemy code
	if place_meeting(x, y, obj_player) && !instance_exists(obj_battle_transition)
	{
		obj_player.paused=true;
		global.returnRoom = room;
		global.fightNo = fightNo;
		global.foesToSpawn = spawn_controller1.scriptedFights[fightNo];
		//spawn_controller1.scriptedFights[fightNo] = true;
		spawn_controller1.scriptedFights[fightNo] = [];//ideally would be set at battle end
		var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
		inst.target_rm = battle_area;
	}
}

else if !(--graceRemaining%5) visible = !visible;
depth = -y;//depth can adjust for moving enemies
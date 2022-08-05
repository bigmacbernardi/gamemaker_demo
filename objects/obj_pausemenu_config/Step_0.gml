/// @description General  menulogic
//var pause_butt = keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace);
var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var cancel = ((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape));
var length = ds_list_size(global.availableParty);
if (!frameHasPassed) frameHasPassed = true;
else if go
	{ 
		if (mode == 0){
			mode = 1;
		}
		else if mode==1{
			action = options[|subindex][1]
			if options[|subindex][1]==magic
				openConfig(global.availableParty[|index],1);
			else if options[|subindex][1]==skills
				openConfig(global.availableParty[|index],2);
			else 
				mode = 2;//start moovin
		}
	}
else if cancel
	{
		if (mode==0) {//actually exiting out
			//if (priorMenu != noone)
			obj_pausemenu_main.selected = true;//logic for if we genericize
	        /*else{
				obj_player.paused = false;
				obj_player.framesToBuffer = 2;
			}*/
			instance_destroy();
		}
		else{
			mode = 0;
			index = 0;
			index2 = -1;
			subindex=-1;
		}
	}
/*else if (obj_player.paused)&&(pause_butt){ //work out quick unpause later
	obj_player.paused = false;
	obj_player.framesToBuffer = 2;
    instance_destroy();
}*/
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left;
	var _moveV = _down - _up;
	if (mode >0){//selecting subindex (equip slot)
		subindex = max(0,min(ds_list_size(options)-1,subindex+_moveH+_moveV));
	}
	else{//assumed mode 0
			if (index < 0){
				index = length;
				index2 = ds_list_size(global.availableParty)-1;
			}
			else if (index == 4){
				index2 = 0;
			}
			else if (index > 4){
				index = 0;
				index2 = -1;
			}
			/*else if (global.currentParty[index]==noone){
				if (_moveV>0){//moving down
					index = 4;
					index2 = 0;
				}
				else{//moving up
					while (global.currentParty[index]==noone){
						index--;	
					}
				}
			}*/
	
		if _moveH{
			index+=_moveH;
			openNewConfig(global.availableParty[|index]);
		}
	}
}
	





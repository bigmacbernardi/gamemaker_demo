/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if(mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		if (index3==3){
			//resorting.  no behavior for this yet
			audio_play_sound(ElecMeany2Hit,100,false);
		}
		else if (mode==0){
			if (options[|index].usable){
		    global.itemInUse = [options[|index],index];
			mode = 1;
			index2=0;
			global.targets = [global.currentParty[index2]];
			}
			else audio_play_sound(Notice3,50,false);
		}else if (mode==1){
			with (global.itemInUse[0]){
				event_user(0); 
			}
			index2 = -1;
			mode = 0;
		}
	}
else if((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace))
	{
		priorMenu.selected = true;
        instance_destroy();
	}
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left; //will use this for pagination/filters/selecting sort options
	var _moveV = _down - _up;
	if (_moveH!= 0){ //will wrap eventually
			index3 += _moveV;
	}
	if (_moveV != 0){
		if (mode==0){
			index += _moveV;
			if (index < 0) index = ds_list_size(options)-1;
			else if (index > ds_list_size(options)-1) index = 0;
		}
		else if (mode == 1){
			index2+= _moveV;
			if (index2 < 0){
				index2 = 3;
				while global.currentParty[index2] == noone{
					index2--;	
				}
			}
			else if (index2 > 3)||(global.currentParty[index2] == noone)
				index2 = 0;
				
			global.targets = [global.currentParty[index2]];
		}
	}
}
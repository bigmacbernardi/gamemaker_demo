/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if allowedToGo{
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		if ++index>=ds_list_size(lines){
			with battle_manager currentMessage = "";	
			instance_destroy();
		}
		show_debug_message("Advancing convo");
	}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			with battle_menu{
				alarm[0]=1;//show the menu and reenable input	
			}
			priorMenu.selected = true;
	        instance_destroy();
		}
	else if choosing{
		var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
		var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
		var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
		var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
		var _moveH = _right - _left;
		var _moveV = _down - _up;
		mychoice = max(0,min(mychoice + _moveH + _moveV,choices-1));
	}
	else if string_char_at(lines[|index],0)=="*"{
		choosing=true;
		choices=[];
		choiceTotal=0;
		var lastChoice=0;
		for (var i = 0; i<string_length(lines[|index]);i++){
			if (string_char_at(lines[|index],i)=="*"){
				choices[choiceTotal++]=string_copy(lines[|index],lastChoice,i-lastChoice);
				lastChoice=i;
			}
		}
		mychoice=0;
	}
	else{
		choosing=false;
		mychoice=-1;
		choiceTotal = 0;
		choices=[];
	}
	if !choosing{
		var line = lines[|index];
		if line!=undefined with battle_manager currentMessage = line;
		else instance_destroy();
	}
}





/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		battle_manager.currentMessage = "";
			//replace this part with selection thing
			show_debug_message("Submenu click detected");
			if optionSlots[|index].mode>=0{
				battle_manager.currentMessage = optionSlots[|index].description;
				if optionSlots[|index].usable{
					visible = 0;
					global.selectMode = optionSlots[|index].mode;
					var inst = instance_create_layer(global.enemies[|0].x, global.enemies[|0].y,"UI_Targeting", skill_selector);
					//inst.mode = optionSlots[|index].mode;//make sure not too late!
					inst.script = optionSlots[|index].script;
					instance_destroy();
				}
			}
			else{ //if optionSlots[|index]==obj_sub{//cond didn't work for some reason
				if optionSlots[|index].usable{
					visible = 0;
					var inst = script_execute(optionSlots[|index].script);
					inst.priorMenu = id;
					//instance_destroy();
				}
			}
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		with battle_menu{
			alarm[0]=1;//show the menu and reenable input	
		}
		priorMenu.selected = true;
        instance_destroy();
	}
else {
	var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
	var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
	var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
	var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
	var _moveH = _right - _left;
	var _moveV = _down - _up;
	if (_moveH != 0){ //will wrap eventually
		index += _moveH;
		if (index < 0) index = ds_list_size(optionSlots)-1;
		if (index > ds_list_size(optionSlots)-1) index = 0;
	}
	if (_moveV < 0){ //assumes width of 3
		index += 3;	
		if (index > ds_list_size(optionSlots)-1) index = 0;
	}else if(_moveV > 0){
		index -= 3;	
		if (index < 0) index = ds_list_size(optionSlots)-1;
	}
	
}
	





/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
if (!frameHasPassed) frameHasPassed = true;
else if goButton
	{
		//replace this part with selection thing
		show_debug_message("Skill click detected");
		if optionSlots[|index].usable{
			visible = 0;
			global.selectMode = optionSlots[|index].mode;
			var inst = instance_create_layer(global.enemies[|0].x, global.enemies[|0].y,"UI_Targeting", optionSlots[|index].selector);
			//inst.mode = optionSlots[|index].mode;//make sure not too late!
			inst.script = optionSlots[|index].script;
	        instance_destroy();
		}
		//else audio_play_sound(snd_nope,100,false);
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
		button_dual_wait.visible = 1;
		button_item.visible = 1;
		priorMenu.selected = true;
        instance_destroy();
	}
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
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
	





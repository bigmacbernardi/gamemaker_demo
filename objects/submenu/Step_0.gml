/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|selectedIndex].x;
//y = global.enemies[|selectedIndex].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		//replace this part with selection thing
		with (global.selectedUnit){
				state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
			}
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
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
	if (_moveH != 0){
		selectedIndex += _moveH;
	}
	if (_moveV != 0){
		//depends how the grid works, so just doin the same for now
		selectedIndex += _moveH;	
	}
}
	





/// @description Used for compound events
// You can write your code in this editor
x = global.enemies[|index].x;
y = global.enemies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		with (global.selectedUnit){
				//state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
				script_execute(script);
			}
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
		button_skill.selected = true;
		button_item.visible = 1;
        instance_destroy();
	}	
	





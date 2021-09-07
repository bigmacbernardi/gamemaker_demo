/// @description Used for compound events
// You can write your code in this editor
x = global.allies[|index].x;
y = global.allies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		//also needs to reduce global.inventory
		
		with (global.itemInUse[0]){
				//global.targets.state = HEAL; 
				//global.targets.layer_sequence_headpos(unitSequence,healStart);
				event_user(0); 
			}
		//global.inventory[|global.itemInUse[1]][1] -= 1;
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
		button_item.visible = 1;
        button_item.selected = true;
		instance_destroy();
	}	
	





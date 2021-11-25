/// @description Used for compound events
// You can write your code in this editor
//if (mode==0) {//enemies
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			if (mode!=2) global.targets=targetSet1; //for mode 2, will be referenced by tech
			with (global.selectedUnit){
					//state = ATTACK;
					
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(rigid_selector.script);
				}
			with battle_manager {
				enqueue(global.selectedUnit);
			}
	        if (mode!=2)instance_destroy();//for mode 2 rigid spells, rigid_selector is DESTROYED BY THE TECHNIQUE
		}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			button_attack.visible = 1;
			button_skill.visible = 1;
			button_skill.selected = true;
			button_dual_wait.visible = 1;
			button_item.visible = 1;
	        instance_destroy();
		}	
/*}
if (mode==1) {//single-ally default
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			with (global.selectedUnit){
					//state = ATTACK; 
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(rigid_selector.script);
				}
	        instance_destroy();
		}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			button_attack.visible = 1;
			button_skill.visible = 1;
			button_skill.selected = true;
			button_dual_wait.visible = 1;
			button_item.visible = 1;
	        instance_destroy();
		}	
}	
else if (mode==2) {//all enemies
	x = global.enemies[|index].x;
	y = global.enemies[|index].y;
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			with (global.selectedUnit){
					//state = ATTACK; 
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(rigid_selector.script);
				}
	        instance_destroy();
		}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			button_attack.visible = 1;
			button_skill.visible = 1;
			button_skill.selected = true;
			button_dual_wait.visible = 1;
			button_item.visible = 1;
	        instance_destroy();
		}	
}	*/





/// @description No navigation, just accept or cancel
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
			
			/*with battle_manager {
				//enqueue(global.selectedUnit); //done by individual skill
			}*/
	        if (mode!=2)instance_destroy();//for mode 2 rigid spells, rigid_selector is DESTROYED BY THE TECHNIQUE
		}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			with battle_menu{
				alarm[0]=1;//show the menu and reenable input	
			}
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
			with battle_menu{
				alarm[0]=1;//show the menu and reenable input	
			}
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
			with battle_menu{
				alarm[0]=1;//show the menu and reenable input	
			}
	        instance_destroy();
		}	
}	*/





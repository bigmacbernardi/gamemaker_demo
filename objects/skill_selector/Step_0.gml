/// @description Used for compound events
// You can write your code in this editor
if (mode != lastMode){ //dummy solution
	lastMode = mode;
	
lastMode = mode;
if (mode==0){ //not learning nested behavior so doing this instead
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = [global.enemies[|i]];
			break;
		}
	}
} else if (mode==1){ //not learning nested behavior so doing this instead
	global.targets = [global.allies[|0]];	
} else if (mode==2){
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets[i] = global.enemies[|i];
		}
	}
} else if (mode==2){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		global.targets[i] = global.allies[|i];
	}
}
}
x = global.targets[0].x;
y = global.targets[0].y;
if (mode==0) {//single-enemy
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			with (global.selectedUnit){
					//state = ATTACK; 
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(skill_selector.script);
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
}	
if (mode==1) {//single-ally default
	if (!frameHasPassed) frameHasPassed = true;
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			with (global.selectedUnit){
					//state = ATTACK; 
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(skill_selector.script);
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
					script_execute(skill_selector.script);
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
}	





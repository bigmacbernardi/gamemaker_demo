/// @description Used for compound events
// You can write your code in this editor
var sets = [global.enemies,global.allies];
if (mode != lastMode){ //mode change!  dumb solution
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
var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
//if (mode<2){//single selection


//check for clicks-- should this be reorged?
if (mode==0) {//single-enemy
	if (_up){
		if (index == 0) index = ds_list_size(sets[mode])-1;
		else index--;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}
	if (_down){
		if (index == ds_list_size(sets[mode])-1) index = 0;
		else index += 1;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}	
	if (_left){//EVENTUALLY this should be based on leftWest and rightEast.
		mode = 1;
		if (index > ds_list_size(global.allies)-1) index = ds_list_size(global.allies)-1;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}
	//if (_right) {mode = 3;}//save for later
	if (!frameHasPassed) frameHasPassed = true;
	else{
		if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
		{
			with (global.selectedUnit){
					//state = ATTACK; 
					layer_sequence_headpos(unitSequence,atkStart);
					script_execute(skill_selector.script);
				}
			with battle_manager {
				enqueue(global.selectedUnit);
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
}
if (floor(mode)==1) {//single-ally default.  updated to allow dead selections
	if (_up){
		if (index == 0) index = instance_number(battle_player)-1;
		else index--;
		global.targets = [global.units[|index]];
		currentMessage = global.targets[0].title;
		/*if (index == 0) index = ds_list_size(sets[mode])-1;
		else index--;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;*/
	}
	if (_down){
		if (index == instance_number(battle_player)-1) index = 0;
		else index++;
		global.targets = [global.units[|index]];
		currentMessage = global.targets[0].title;
		/*if (index == ds_list_size(sets[mode])-1) index = 0;
		else index += 1;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;*/
	}
	
	if (_right){//EVENTUALLY this should be based on leftWest and rightEast.
		mode = 0;
		if (index > ds_list_size(global.enemies)-1) index = ds_list_size(global.enemies)-1;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}
	//if (_left) {mode = 2;}//save for later
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
			button_dual_wait.visible = 1;
			button_item.visible = 1;
	        instance_destroy();
		}	
}	
else if (mode==2) {//all enemies
	
	if (_left){
		mode = 3;
		global.targets=[];//clearing for smaller team
		for(var i = 0; i < ds_list_size(global.allies); i++){    
			global.targets[i] = global.allies[|i];
		}
		x = global.targets[0].x;
		y = global.targets[0].y;
		currentMessage = "All allies";
	}
	else{
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
			button_dual_wait.visible = 1;
			button_item.visible = 1;
		    instance_destroy();
		}
	}
}	
else if (mode==3) {//all enemies
	
	if (_right){
		mode = 2;
		global.targets=[];//clearing for smaller team
		for(var i = 0; i < ds_list_size(global.enemies); i++){    
			global.targets[i] = global.enemies[|i];
		}
		x = global.targets[0].x;
		y = global.targets[0].y;
		currentMessage = "All enemies";
	}
	else{
		x = global.allies[|index].x;
		y = global.allies[|index].y;
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
			button_dual_wait.visible = 1;
			button_item.visible = 1;
		    instance_destroy();
		}
	}
}





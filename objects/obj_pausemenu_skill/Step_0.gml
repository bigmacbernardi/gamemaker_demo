/// @description General  menulogic
var pause_butt = keyboard_check_released(vk_escape);// || keyboard_check_released(vk_backspace);

if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{ 
		//might use this to go up
		/*var inst = instance_create_depth(0,0,-100, submenu);
		inst.index = 0;
		for (var i = 0; i < ds_list_size(options); i++){
			if (i==index) continue;
			with (options[|i]){
				instance_destroy();	//????
			}
		}*/
	}
else if((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace))
	{
		//replace following with menu buttons?
		/*button_attack.visible = 1;
		button_skill.visible = 1;
		button_item.visible = 1;*/
		if (priorMenu != noone) priorMenu.selected = true;//logic for if we genericize
        else{
			obj_player.paused = false;
			obj_player.framesToBuffer = 2;
		}
		instance_destroy();
		
	}
else if (obj_player.paused)&&(pause_butt){
	if instance_exists(obj_pausemenu_main) instance_destroy(obj_pausemenu_main);
	obj_player.paused = false;
	obj_player.framesToBuffer = 2;
    instance_destroy();
}
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left;
	//var _moveV = _down - _up;
	/*if (_moveV != 0){ //should be able to be used to get more information
		index += _moveV;
		if (index < 0) index = ds_list_size(options)-1;
		if (index > ds_list_size(options)-1) index = 0;
	}*/
	if (_moveH < 0){ 
		index--;	
		if (index < 0) index = ds_list_size(options)-1;
		global.selectedUnit = global.availableParty[|index];
		skillsToShow = slot_skills();
	}else if(_moveH > 0){
		index++;	
		if (index > ds_list_size(options)-1) index = 0;
		global.selectedUnit = global.availableParty[|index];
		skillsToShow = slot_skills();
	}
}
	





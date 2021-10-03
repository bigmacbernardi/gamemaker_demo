var pause_butt = keyboard_check(vk_escape) || keyboard_check(vk_backspace);

/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		//for(var i = 0; i < ds_list_size(global.allies); i++){
		//if (global.allies[|i].state != DEATH){//probably shouldn't be a concern?
	    global.itemInUse = [options[|index],index];
		global.targets = global.allies[|0];
		var inst = instance_create_layer(global.allies[|0].x, global.allies[|0].y,"UI_Targeting", itm_selector);
		inst.index = 0;
		for (var i = 0; i < ds_list_size(options); i++){
			if (i==index) continue;
			with (options[|i]){
				instance_destroy();	
			}
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
	if (_moveH != 0){ //will wrap eventually
		index += _moveH;
		if (index < 0) index = ds_list_size(options)-1;
		if (index > ds_list_size(options)-1) index = 0;
	}
	if (_moveV < 0){ //assumes width of 3
		index += 3;	
		if (index > ds_list_size(options)-1) index = 0;
	}else if(_moveV > 0){
		index -= 3;	
		if (index < 0) index = ds_list_size(options)-1;
	}
	
}
if (obj_player.paused)&&(pause_butt){
	obj_player.paused = false;
    instance_destroy();
}
	





/// @description General  menulogic
var pause_butt = keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace);
if (selected){
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{ 
		if variable_instance_exists(options[|index],"submenu"){
			instance_create_depth(x,y,-100, options[|index].submenu);
			selected=false;	
		}
		
		//options[|index].alarm[0]=1;
		//submenu doesn't exist yet
		/*var inst = instance_create_depth(0,0,-100, submenu);
		inst.index = 0;
		for (var i = 0; i < ds_list_size(options); i++){
			if (i==index) continue;
			with (options[|i]){
				instance_destroy();	//????
			}
		}*/
	}
else if((keyboard_check_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace))
	{
		if (priorMenu != noone) priorMenu.selected = true;//logic for if we genericize
        else{
			obj_player.framesToBuffer = 3;
			obj_player.paused = false;
			instance_destroy();
		}
	}
else if (obj_player.paused)&&(pause_butt){
	obj_player.framesToBuffer = 3;
	obj_player.paused = false;
    instance_destroy();
}
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left;
	var _moveV = _down - _up;
	var startingIndex =index; //just used to track if sound should play rn
	if (_moveV != 0){ //will wrap eventually
		index += _moveV;
		if (index < 0) index = ds_list_size(options)-1;
		if (index > ds_list_size(options)-1) index = 0;
	}
	if (_moveH < 0){ //assumes width of 3
		index += 3;	
		if (index > ds_list_size(options)-1) index = 0;
	}else if(_moveH > 0){
		index -= 3;	
		if (index < 0) index = ds_list_size(options)-1;
	}
	if (index !=startingIndex) audio_play_sound(Notice2,100,false);
}
}




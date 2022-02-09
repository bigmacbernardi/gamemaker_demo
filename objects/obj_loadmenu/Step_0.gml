/// @description Insert description here
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
{ 
	global.saveSlot = index;
	var name = "save"+string(index)+".ini";
	if file_exists(name) loadGame(name);
}
else if((keyboard_check_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace))
{
	if !instance_exists(obj_player){//go back
		with obj_startmenu{
			mode = 1;
			index = 1;
		}
		instance_destroy();
	}
	else{ //doing it from in-game
		obj_player.framesToBuffer = 3;
		obj_player.paused = false;
	}
	instance_destroy();
}
else if instance_exists(obj_player) && (obj_player.paused)&&(pause_butt){
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
		if (index < 1) index = 99;
		if (index > 99) index = 0;
	}
	if (_moveH < 0){ //assumes width of 3
		index += 3;	
		if (index > 99) index = 0;
	}else if(_moveH > 0){
		index -= 3;	
		if (index < 1) index = 99;
	}
	if (index !=startingIndex) audio_play_sound(Notice2,100,false);
}
/// @description Insert description here
// You can write your code in this editor

if (index != -1){//when index == -1, pausemenu_stat will handle all input
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left;
	var _moveV = _down - _up;
	var lastIndex = index;
	if (_moveH < 0){ //wraps
		if (index%4 != 0) index--;
		else index+=3;
	}
	else if(_moveH > 0){ //wraps
		if (index%4 != 3) index++;
		else index-=3;
	}
	if (_moveV > 0){ //assumes width of 4
		index += 4;	
		if (index > 15) index = (index % 4);
	}else if(_moveV < 0){
		index -= 4;	
		if (index < 0) index+=16;
	}
	if lastIndex!=index{
		show_debug_message("Index changed from "+string(lastIndex)+" to "+string(index));
		if lastIndex != -1 perks[lastIndex].selected=false;
		if index != -1 perks[index].selected=true;
	}
}	
	
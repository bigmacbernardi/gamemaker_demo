/// @description Insert description here
if global.selectedUnit<0 or !global.selectedUnit.isPlayer{
	menuDisplaying=false;
	menuActive=false;
}
if selected menuActive = true;
if menuDisplaying and menuActive{
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
	//var cancel = ((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape));
	//cancel should be handled by whatever's created by actions[index]
	//var _moveV = _down - _up;
	if _down{
		if index==(array_length(names)-1) or index==3 index = 0;
		else if index==7 index = 4
		else index++;
	}
	else if _up{
		if index==4 index=(min(7,array_length(names)-1))
		else if index=0 index=3;
		else index--;
	}
	if _right{
		if index < array_length(names)-4 index+=4;
		else if index<4 index=array_length(names)-1;
		else if index==4 index=0;
		else index=1;
	}
	else if _left{
		if index>3 index-=4;
		else if array_length(names)>index+4 index += 4;
		//else index = 0;//? on the fence about this
	}
	
	if go{
		//show_debug_message("MENU GOING: "+string(index)+"="+string(actions[index]));
		menuActive=false;
		selected=false;
		actions[index]();//script_execute(actions[index]);
		//the long version:
		/*switch(index){
			case 0: show_debug_message("Attack");
					attack();
					break;
			case 1: show_debug_message("Skills");
					skills();
					break;
			case 2: show_debug_message("Stills");
					skills();
					break;
			case 3: show_debug_message("Item");
					item();
					break;
			case 4: show_debug_message("Wait");
					wait();
					break;
			case 5: show_debug_message("RUN");
					flee();
					break;
			default:show_debug_message("Menu index was "+string(index));
					dual();
					break;
		}*/
	}
}	
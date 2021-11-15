/// @description General  menulogic
//var pause_butt = keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace);
var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var cancel = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
if (!frameHasPassed) frameHasPassed = true;
else if go
	{ 
		if (mode == 0){
			if (index==4){ //selected
				mode = 2;
				index = 0;
			}
			else{
				mode = 1;
				index2 = 0;
			}
			
		}
		else /*if (mode==1) doesn't matter*/{
			if (index > 1)&&((global.currentParty[0]==noone)||(global.currentParty[1]==noone)){
				//do error
				show_debug_message("Fill out your first team first!");//pop up as window
				mode = 0;
				index = 0;
				index2 = -1;
			}
			else{
				var memberToSlot = global.availableParty[|index2];
				var currentPos = -1;
				for (var i =0; i<4;i++){
					if (global.currentParty[i] == memberToSlot){
						currentPos = i;
						break;
					}
				}
				if (currentPos==-1){
					global.currentParty[index] = global.availableParty[|index2]
				}
				else{
					var temp = global.currentParty[index];
					global.currentParty[index] = global.currentParty[currentPos];
					global.currentParty[currentPos] = temp;
				}
				mode = 0;
				index = 0;
				index2 = -1;
			}
			//work with index2	
		}
	}
else if cancel
	{
		if (mode==0) {//actually exiting out
			//if (priorMenu != noone)
			obj_pausemenu_main.selected = true;//logic for if we genericize
	        /*else{
				obj_player.paused = false;
				obj_player.framesToBuffer = 2;
			}*/
			instance_destroy();
		}
		else mode = 0;
	}
/*else if (obj_player.paused)&&(pause_butt){ //work out quick unpause later
	obj_player.paused = false;
	obj_player.framesToBuffer = 2;
    instance_destroy();
}*/
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left;
	var _moveV = _down - _up;
	if (_moveV != 0){ //will wrap eventually
		if (index ==4){ //submenu is selected in mode 0
			if (_moveV>0){//moving down
				if (ds_list_size(global.availableParty) > index2+4) index2+=4;
				else if (mode!=1) {
					index = 0; //wraps to top slot in Mode 0
					index2 = -1;//and deselects index2
				}
				else index2 = index2%4;//wraps to top row in Mode 1
			}
			else if (_moveV<0){//moving up
				if (index2 > 3) index2-=4;
				else if (mode!=1) {
					index = 3; //comes up to bottom slot
					index2 = -1;//and deselects index2
				}
				//else index2%4;//should wrap to bottom row in Mode 1 but does nothing now
			}
		}
		else if (mode != 1) index += _moveV;
		if (mode==2){
			if (index < 0) index = 3;
			else if (index > 3)index = 0;
		}
		else{//assumed mode 0
			if (index < 0){
				index = 4;
				index2 = ds_list_size(global.availableParty)-1;
			}
			else if (index == 4){
				index2 = 0;
			}
			else if (index > 4){
				index = 0;
				index2 = -1;
			}
			
		}
	}
	if (_moveH != 0)&&(mode!=2)&&(index2!=-1){ 
		index2 += _moveH;	
		if (index2 > ds_list_size(global.availableParty)-1) index2 = max(index2-3,0);
		else if (index2 < 0) index2 = min(index+3,ds_list_size(global.availableParty)-1);
	}
}
	





/// @description General  menulogic
//var pause_butt = keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace);
var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var cancel = ((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape));
var length = ds_list_size(global.availableParty);
if (!frameHasPassed) frameHasPassed = true;
else if go
	{ 
		if (mode == 0){
			if (index==length){ //selecting right part
				mode = 3;
				index = 0;
				subindex = options[|index2].category;
			}
			else{
				mode = 1;
				//index2 = 0;
			}
			
		}
		//else if mode==1 or mode==4{//selecting SUBSLOT
		else if mode == 1{
			mode = 2;
			index2 = 0;
		}
		/*else if mode==3{//actually, shouldn't exist
			mode = 4;
		}*/
		else{//modes 2 and higher
			if (index > 1)&&((global.currentParty[0]==noone)||(global.currentParty[1]==noone)){
				//this check should be pushed further down the logic
				show_debug_message("Fill out your first team first!");//pop up as window
				mode = 0;
				index = 0;
				index2 = -1;
			}
			else{
				var equipToSlot = options[|index2];
				var currentOwner = equipToSlot.currentUser;
				/*for (var i =0; i<4;i++){
					if (global.equipped[i][subindex] == equipToSlot){//this is already done by curuser
						currentOwner = i;
						break;
					}
				}*/
				if global.equipped[global.currentParty[index]][subindex]!= noone //if they already have something
					 global.equipped[global.currentParty[index]][subindex].currentUser=noone;
				if (currentOwner!=noone){
					global.equipped[currentOwner][subindex]=noone;
					/*var temp = global.currentParty[index];
					global.currentParty[index] = global.currentParty[currentPos];
					global.currentParty[currentPos] = temp;*/
				}
				global.equipped[global.currentParty[index]][subindex] = equipToSlot;
				global.equipped[global.currentParty[index]][subindex].currentUser = global.currentParty[index];
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
		else{
			mode = 0;
			index = 0;
			index2 = -1;
			subindex=0;
		}
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
	if (_moveH != 0){ //HORIZO
		if (mode ==1){//selecting subindex (equip slot)
			subindex+=_moveH;
			if subindex<0 subindex=7;
			else if subindex>7 subindex=0;
		}
		else if (index ==8){ //submenu is selected in mode 0
			if (_moveH>0){//moving down
				if (ds_list_size(global.availableParty) > index2+4) index2+=4;
				else if (mode!=1) {
					index = 0; //wraps to top slot in Mode 0
					index2 = -1;//and deselects index2
				}
				else index2 = index2%4;//wraps to top row in Mode 1
			}
			else if (_moveH<0){//moving up
				if (index2 > 3) index2-=4;
				else if (mode!=1) {
					index = length-1; //comes up to bottom slot? what?
					index2 = -1;//and deselects index2
				}
				//else index2%4;//should wrap to bottom row in Mode 1 but does nothing now
			}
		}
		else if (mode != 1){
			index += _moveH;
			if (index < 0)
				index = length-1;
			else if (index >= length)
				index = 0;			
		}
		if (mode==2){
			if (index < 0) index = length-1;
			else if (index > length-1)index = 0;
		}
		else{//assumed mode 0
			if (index < 0){
				index = length;
				index2 = ds_list_size(global.availableParty)-1;
			}
			else if (index == 4){
				index2 = 0;
			}
			else if (index > 4){
				index = 0;
				index2 = -1;
			}
			/*else if (global.currentParty[index]==noone){
				if (_moveV>0){//moving down
					index = 4;
					index2 = 0;
				}
				else{//moving up
					while (global.currentParty[index]==noone){
						index--;	
					}
				}
			}*/
			
		}
	}
	if (_moveV != 0)&&(mode<3)&&(index2!=-1){ 
		index2 += _moveV;	
		if (index2 > ds_list_size(global.availableParty)-1) index2 = max(index2-3,0);
		else if (index2 < 0) index2 = min(index+3,ds_list_size(global.availableParty)-1);
	}
}
	





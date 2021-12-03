/// @description General  menulogic
var pause_butt = keyboard_check_released(vk_escape);// || keyboard_check_released(vk_backspace);

if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{ 
		//might use this to go up
		if (mytree.index==-1)mytree.index=0;
	}
else if((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace))
	{
		if (mytree.index>-1)mytree.index=-1; //drop down
		else { //exit
			if (priorMenu != noone) priorMenu.selected = true;//logic for if we genericize
	        else{
				obj_player.paused = false;
				obj_player.framesToBuffer = 2;
			}
			if instance_exists(obj_stattree) instance_destroy(obj_stattree);
			instance_destroy();
		}
	}
else if (obj_player.paused)&&(pause_butt){
	if instance_exists(obj_stattree) instance_destroy(obj_stattree);
	if instance_exists(obj_pausemenu_main) instance_destroy(obj_pausemenu_main);
	obj_player.paused = false;
	obj_player.framesToBuffer = 2;
    instance_destroy();
}
else {
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	if (_down && mytree.index>11)mytree.index=-1;
	if (mytree.index==-1){
		var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
		if _up mytree.index=(index-scrollLevel)>2?13:12;
		var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
		var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
		var _moveH = _right - _left;
		if (_moveH < 0){ 
			index--;	
			if (index < 0) index = ds_list_size(options)-1;
			instance_destroy(mytree);
			mytree = instance_create_depth(x,y,depth-1,obj_stattree);
		}else if(_moveH > 0){
			index++;	
			if (index > ds_list_size(options)-1) index = 0;
			instance_destroy(mytree);
			mytree = instance_create_depth(x,y,depth-1,obj_stattree);
		}
	}
	
}
	





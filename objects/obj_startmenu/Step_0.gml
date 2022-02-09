/// @description Handles navigation logic and progression
// You can write your code in this editor

if mode==0{
	if keyboard_check(vk_anykey) //should be used for 
	        mode=1;
	else for (i=gp_face1; i<gp_axisrv; i++){
	    if gamepad_button_check(0, i){
	        mode=1;
	        exit;
	        }
	    }	
}else{
	
	var _moveV =  keyboard_check_released(vk_down) - keyboard_check_released(vk_up);
	var _moveH =  keyboard_check_released(vk_down) - keyboard_check_released(vk_up);
	var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
	var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
	if goButton{
		if mode == 2 {
			if index == 0{
				instance_create_depth(0,0,0,gamestarter);
				instance_destroy();
			}else if /*index == 1 &&*/ !instance_exists(obj_loadmenu){
				instance_create_depth(0,0,depth-1,obj_loadmenu);
				mode=-1;//to deactivate
			}
		}
		else if mode==1{
			mode = index + 2;
			index = 0;
		}
	}
	if mode==2 index +=_moveH;
	else index+= _moveV;
	if mode>1 and backButton{
		index = mode - 2;
		mode = 1;
	}
		
}
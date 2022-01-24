/// @description Insert description here
// You can write your code in this editor
if mode=0{
	if keyboard_check(vk_anykey)
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
	if mode==2 index +=_moveH;
	else index+= _moveV;
	if mode==0 and goButton
		mode = index + 1;
	if mode>0 and backButton
		mode = 0;
		
}
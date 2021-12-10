/// @description Oscillate/Spawn next
if !instance_exists(obj_skee_meter2){
	if mouse_x!=lastMX{
		ballX = mouse_x;
	}
	var minPow = 400;
	var maxPow = 1100;
	if increasing {
		pow+=10;
		if pow >= maxPow
			increasing = false;
	}
	else{
		pow-=10;
		if pow <= minPow
			increasing = true;
	}
	var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
	var rightButton = keyboard_check(0x44) or keyboard_check(vk_right);
	var leftButton = keyboard_check(0x41) or keyboard_check(vk_left);
	var runButton = keyboard_check(vk_shift);
	var _moveH = (rightButton - leftButton) * (runButton+1);
	if frameHasPassed{
		ballX+=_moveH*3;
		if goButton{
			if !instance_exists(obj_skee_meter2) instance_create_depth(ballX,0,depth-1,obj_skee_meter2);
			frameHasPassed=false;
		}
	}else frameHasPassed=true;
	lastMX = mouse_x;
}
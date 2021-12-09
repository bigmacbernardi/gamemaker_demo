/// @description Oscillate/Spawn next
if !instance_exists(obj_skee_meter2){
	var minPow = 400;
	var maxPow = 1100;
	if increasing {
		pow+=5;
		if pow >= maxPow
			increasing = false;
	}
	else{
		pow-=5;
		if pow <= minPow
			increasing = true;
	}
	var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));

	if frameHasPassed{
		if goButton{
			if !instance_exists(obj_skee_meter2) instance_create_depth(ballX,0,depth-1,obj_skee_meter2);
			frameHasPassed=false;
		}
	}else frameHasPassed=true;
}
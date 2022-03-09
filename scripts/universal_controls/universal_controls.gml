function universal_controls(){
	//can't wait to forget about this file and recode the entire thing late in the process
}

function upPressed(){
	return keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("A")) or gamepad_button_check_pressed(0,gp_axislv);
}
function upActive(){
	return keyboard_check(vk_up) or keyboard_check(ord("A")) or gamepad_button_check(0,gp_axislv);
}
function upReleased(){
	return keyboard_check_released(vk_up) or keyboard_check_released(ord("A")) or gamepad_button_check_released(0,gp_axislv);
}

function downPressed(){
	return keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(0,gp_axislv);	
}
function downActive(){
	return keyboard_check(vk_down) or keyboard_check(ord("S")) or gamepad_axis_value(0,gp_axislv);
}
function downReleased(){
	return keyboard_check_released(vk_down) or keyboard_check_released(ord("S")) or gamepad_button_check_released(0,gp_axislv);
}
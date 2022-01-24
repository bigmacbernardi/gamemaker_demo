/// @description Insert description here
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check_released(vk_down) - keyboard_check_released(vk_up);
var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
level = level + _moveV + _moveH;
if goButton{
	//update the level
	obj_player.paused=false;
	instance_destroy();
}
else if backButton{
	obj_player.paused=false;
	instance_destroy();	
}
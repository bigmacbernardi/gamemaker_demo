/// @description Insert description here
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check_released(vk_up) - keyboard_check_released(vk_down);
var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
currentIndex = max(0,min(array_length(names)-1,currentIndex - _moveV));
level = max(1,min(99,level + _moveV + _moveH));
if goButton{
	
}
else if backButton{
	instance_destroy();	
}
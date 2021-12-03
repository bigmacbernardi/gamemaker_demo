/// @description Insert description here
// You can write your code in this editor
if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
{
	if index == 0
		game_restart();
	else if index == 1
		game_end();
}
else{
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	if _left index = 0;
	else if _right index = 1;
}
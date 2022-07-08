/// @description Insert description here
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check/*_released*/(vk_up) - keyboard_check/*_released*/(vk_down);
var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
if _moveV ==1 and currentIndex==scrollLevel and easeFrame {
	scrollLevel = max(0,scrollLevel-1);
	easeFrame = true;
}
else if _moveV==-1 and currentIndex==scrollLevel+10 {
	scrollLevel = min(array_length(names)-11,scrollLevel+1);
}
easeFrame = false;
currentIndex = max(0,min(array_length(names)-1,currentIndex - _moveV));
if goButton{
	instance_create_depth(x,y,0,obj_warphelper);
      room_goto(rooms[currentIndex]);
}
else if backButton{
	instance_destroy();	
}
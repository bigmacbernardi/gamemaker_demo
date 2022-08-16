/// @description Insert description here
// You can write your code in this editor
var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));

if frameHasPassed and menuActive{
	if goButton{
		if menuIndex == 0 and baitRemain>0{
			instance_create_depth(0,0,0,obj_timeforfish);
			--baitRemain;
		}
	}
}else if menuActive frameHasPassed=true;
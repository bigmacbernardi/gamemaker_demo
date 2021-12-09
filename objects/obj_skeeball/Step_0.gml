/// @description Insert description here
// You can write your code in this editor
var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));

if frameHasPassed{
	if goButton{
		if ballsRemain>0{//ballsRemain-->0
			//instance_create_depth(mouse_x, mouse_y,depth-1,obj_ball);	
			if !instance_exists(obj_skee_meter1) instance_create_depth(0,0,depth-1,obj_skee_meter1);
		}else room_goto(Room3);
		frameHasPassed=false;
	}
}else frameHasPassed=true;
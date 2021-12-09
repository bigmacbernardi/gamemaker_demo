/// @description Insert description here
// You can write your code in this editor
var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));

if frameHasPassed{
	if goButton{
	//instance_create_layer(500, 50,"Instances",obj_ball);//just dudn't work?
		if ballsRemain-->0
			instance_create_depth(mouse_x, mouse_y,depth-1,obj_ball);			
		else room_goto(Room3);
		frameHasPassed=false;
	}
}else frameHasPassed=true;
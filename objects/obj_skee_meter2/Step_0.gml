/// @description Oscillate/Spawn next
var minAngle = -80;
var maxAngle = 80;

if increasing {
	angle++;
	if angle== maxAngle
		increasing = false;
}
else{
	angle--;
	if angle == minAngle
		increasing = false;
}


var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));

if frameHasPassed{
	if goButton{
		with obj_skeeball{
			ballsRemain--;
		}
		instance_create_depth(ballX, 11 * camera_get_view_height(cam)/12,depth-1,obj_ball);
		instance_destroy(obj_skee_meter1);
		instance_destroy();
	}
}else frameHasPassed=true;
/// @description Oscillate/Spawn next

var minAngle = -170;
var maxAngle = -10;
if increasing {
	angle++;
	if angle>= maxAngle
		increasing = false;
}
else{
	angle--;
	if angle <= minAngle
		increasing = true;
}


var goButton = ((mouse_check_button_released(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
//var leftButton = ((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A")));
//var rightButton = ((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("D")));
var rightButton = keyboard_check(0x44) or keyboard_check(vk_right);
var leftButton = keyboard_check(0x41) or keyboard_check(vk_left);

var _moveH = rightButton - leftButton;
if frameHasPassed{
	if goButton{
		with obj_skeeball{
			ballsRemain--;
		}
		instance_create_depth(ballX, 11 * camera_get_view_height(cam)/12,depth-1,obj_ball);
	}
	ballX+=_moveH*3;
	/*if leftButton
		ballX--;	
	if rightButton
		ballX++;*/	
}else frameHasPassed=true;
if !instance_exists(obj_skee_meter1) instance_destroy();
else{
	powX = obj_skee_meter1.pow*dcos(angle);
	powY = obj_skee_meter1.pow*dsin(angle);
}
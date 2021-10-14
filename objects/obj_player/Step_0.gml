/// @description Insert description here
// You can write your code in this editor
right_key = keyboard_check(0x44);
left_key = keyboard_check(0x41);
up_key = keyboard_check(0x57);
down_key = keyboard_check(0x53);
run_key = keyboard_check(vk_shift);
check_butt = keyboard_check(vk_space) || keyboard_check(vk_enter);
pause_butt = keyboard_check(vk_escape) || keyboard_check(vk_backspace);
x_spd = (right_key - left_key) * move_spd * (run_key?1.5:1);
y_spd = (down_key - up_key) * move_spd * (run_key?1.5:1);

//cheap pause effect
/*if instance_exists(obj_pauser)//might as well just use mainmenu
	{
		x_spd = 0;
		y_spd = 0;
	}*/

if (!paused){
//collisions
if place_meeting(x + x_spd, y, obj_wall) == true
	{
		x_spd = 0; //this activates the moving animations
		
	}
if place_meeting(x, y + y_spd, obj_wall) == true
	{
		y_spd = 0;
		
	}
	
if ((x_spd==0)&&(y_spd==0))image_speed = 0;
else{
	if ((y_spd<0)&&(sprite_index == spr_person1)){ //turning up
		eye_x1 = x - 16;
		eye_y1 = y - 16;
		eye_x2 = x;
		eye_y2 = y;
		sprite_index = spr_person1_back;
	}
	else if ((y_spd>0)&&(sprite_index == spr_person1_back)){ //turning down
		eye_y1 = y + sprite_height;
		eye_x2 = x;
		eye_y2 = y + sprite_height + 16;
		sprite_index = spr_person1;
	}
	else{ //just left or right
		eye_y1 = y - 1;
		eye_y2 = y + sprite_height + 1;
	}
	if ((x_spd<0)&&(image_xscale != -1)) // turning left
	{
		eye_x1 = x - 16;//left boundary
		eye_x2 = x; //right boundary
		image_xscale = -1;
		//x-= sprite_width;
	}
	else if ((x_spd>0)&&(image_xscale == -1)) //turning right
	{
		eye_x1 = x + sprite_width;
		eye_x2 = x + sprite_width + 16;
		image_xscale = 1;
		//x-= sprite_width;
	}
	else { //just up or down
		eye_x1 = x - 1;
		eye_x2 = x + sprite_width + 1;
		
	}
	image_speed = 4;
}
x += x_spd;
y += y_spd;
if (check_butt)
{
	if (checkReleased && framesToBuffer==0)
	{
		checkReleased = false;
		inst = collision_rectangle(eye_x1, eye_y1, eye_x2, eye_y2, checkable, false, true);	
		if inst != noone
		{
		   paused = true;//preventing other player input
		   with (inst) event_user(0);
		}
	}
}
else checkReleased = true;
if (pause_butt && (framesToBuffer==0)){
	x_spd = 0;//cheap
	y_spd = 0;//cheap
	paused = true;
	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam),-10,obj_mainmenu);
}
else if (framesToBuffer>0){
	framesToBuffer--;	
}
}
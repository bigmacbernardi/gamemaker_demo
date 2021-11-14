/// @description Insert description here
// You can write your code in this editor
right_key = keyboard_check(0x44);
left_key = keyboard_check(0x41);
up_key = keyboard_check(0x57);
down_key = keyboard_check(0x53);
run_key = keyboard_check(vk_shift);
check_butt = keyboard_check(vk_space) || keyboard_check(vk_enter);
pause_butt = (keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace));
x_spd = (right_key - left_key) * move_spd * (run_key?1.5:1);
y_spd = (down_key - up_key) * move_spd * (run_key?1.5:1);
//cheap pause effect
/*if instance_exists(obj_pauser)//might as well just use pausemenu_main
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
	if (y_spd<0){ //moving up
		eye_y1 = y - 16;
		eye_y2 = y;
		if (sprite_index != back_sprite) sprite_index = back_sprite; //turning up
	}
	else if (y_spd>0){ //moving down
		eye_y1 = y + sprite_height;
		eye_y2 = y + sprite_height + 16;
		if (sprite_index != front_sprite) sprite_index = front_sprite; //turning down
		//show_debug_message("Y's changed to: "+string(y)+": "+string(eye_y1)+","+string(eye_y2));
	}
	else{ //just left or right
		eye_y1 = y - 1;
		eye_y2 = y + sprite_height + 1;
		
		//show_debug_message("Y's reset to: "+string(y)+": "+string(eye_y1)+","+string(eye_y2));
	}
	if (x_spd<0) // moving left
	{
		eye_x1 = x - 16 -  abs(sprite_width/2) ;//left boundary
		eye_x2 = x -  abs(sprite_width/2); //right boundary
		if (sprite_index != left_sprite) sprite_index = left_sprite;//turning left
		//x-= sprite_width;
		//show_debug_message("Lefty X's changed to: "+string(x)+": "+string(eye_x1)+","+string(eye_x2));
	}
	else if (x_spd>0) //moving right
	{
		if (sprite_index != right_sprite) sprite_index = right_sprite;
		eye_x1 = x + sprite_width/2;
		eye_x2 = x + sprite_width/2 + 16;
		//show_debug_message("Righty X's changed to: "+string(x)+": "+string(eye_x1)+","+string(eye_x2));
		//x-= sprite_width;
	}
	else if (y_spd != 0) { //just up or down -- not even needed anymore?
		eye_x1 = x -  abs(sprite_width)/2 - 1;
		eye_x2 = x + abs(sprite_width)/2 + 1;
		
		//show_debug_message("X's reset");//Last X's changed to: "+string(x)+": "+string(eye_x1)+","+string(eye_x2));
		
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
		inst = collision_rectangle(round(eye_x1), round(eye_y1), round(eye_x2), round(eye_y2), checkable, false, true);	
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
	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam),-10,obj_pausemenu_main);
}
else if (framesToBuffer>0){
	framesToBuffer--;	
}
}
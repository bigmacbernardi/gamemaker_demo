/// @description Insert description here
// You can write your code in this editor
pause_butt = (keyboard_check_released(vk_escape) || keyboard_check_released(vk_backspace));
//cheap pause effect
/*if instance_exists(obj_pauser)//might as well just use pausemenu_main
	{
		x_spd = 0;
		y_spd = 0;
	}*/

if (!paused){
right_key = keyboard_check(0x44) or keyboard_check(vk_right);
left_key = keyboard_check(0x41) or keyboard_check(vk_left);
up_key = keyboard_check(0x57) or keyboard_check(vk_up);
down_key = keyboard_check(0x53) or keyboard_check(vk_down);
run_key = keyboard_check(vk_shift);
check_butt = keyboard_check(vk_space) || keyboard_check(vk_enter);
x_spd = (right_key - left_key) * move_spd * (run_key?1.5:1);
y_spd = (down_key - up_key) * move_spd * (run_key?1.5:1);
//collisions:  NEEDS MAJOR IMPROVEMENTS.  
//If you try to move diagonally against wall you should SIDLE AGAINST IT.
//If you clip into wall it should PUSH YOU OUT.
var real_x_spd = x_spd;
var real_y_spd = y_spd;
if place_meeting(x + x_spd, y, obj_wall) == true
//if place_meeting(x + x_spd, y + y_spd, obj_wall) == true //thought this version could be better.  it wasn't, it just changed which diagonals screech to a halt at stop
{
//	show_debug_message("WILL COLLIDE HORIZICALLY");
	if x_spd ==0 {//or (y_spd != 0 and place_meeting(x + x_spd, y + y_spd, obj_wall) and !place_meeting(x, y + y_spd, obj_wall)){//got stuck after a turn
		for (var i = -1;i<2;i++){
			for (var j = -1;j<2;j++){
				if place_meeting(x + i, y+j, obj_wall) == false{
					show_debug_message("Corner push!");
					x+=i;
					y+=j;
					break	
				}
			}
		}
	}
	else if place_meeting(x + x_spd, y-1, obj_wall) == false
	{
		show_debug_message("This pushup");
		y-=1;
		x+=x_spd;
		real_y_spd = 0;
	}
	else{
		real_x_spd = 0;
		var next_try = x_spd+(x_spd>0?-0.5:0.5);
		while next_try!=0{
			//show_debug_message("TRYING TO MOVE RIGHT BY "+string(next_try));
			if place_meeting(x + next_try, y, obj_wall) == true{		
				next_try+=next_try>0?-0.5:0.5;	
			}
			else{
				x += next_try;
				real_x_spd = next_try;
				next_try = 0;//like a break, but cheeky	
			}
		}
	}
	//x_spd = 0; //this activates the moving animations? what
		
}
else x += x_spd;
//if place_meeting(x, y + y_spd, obj_wall) == true
if place_meeting(x, y + y_spd, obj_wall) == true 
{
	
	
	//show_debug_message("WILL COLLIDE VERTICALLY");
	var next_try = y_spd+(y_spd>0?-0.5:0.5);
	real_y_spd = 0;
	while next_try!=0{
		//show_debug_message("TRYING TO MOVE DOWN BY "+string(next_try));
		if place_meeting(x,y + next_try, obj_wall) == true{		
			next_try+=next_try>0?-0.5:0.5;	
		}
		else{
			show_debug_message("THIS pushup");
			y += next_try;
			real_y_spd = next_try;
			break;//SHOULD be better than next_try=0
		}
	}
	//y_spd = 0;		
	
}
else y += y_spd;

//turning logic; should have been after movement all along!
if ((x_spd==0)&&(y_spd==0))image_speed = 0;
else{
	if (real_y_spd<0){ //moving up
		eye_y1 = y - 16;
		eye_y2 = y;
		if (sprite_index != back_sprite) sprite_index = back_sprite; //turning up
		if place_meeting(x, y, obj_wall) == true && 
			place_meeting(x, y+1, obj_wall) == false//to compensate for change in collision box
			y+=1;
}
	else if (real_y_spd>0){ //moving down
		eye_y1 = y + sprite_height;
		eye_y2 = y + sprite_height + 16;
		if (sprite_index != front_sprite) sprite_index = front_sprite; //turning down
		if place_meeting(x, y, obj_wall) == true && 
			place_meeting(x, y-1, obj_wall) == false//to compensate for change in collision box
			{
			y-=1;
			show_debug_message("PUSH UP");
			}
		//show_debug_message("Y's changed to: "+string(y)+": "+string(eye_y1)+","+string(eye_y2));
		
	}
	else{ //just left or right
		eye_y1 = y - 1;
		eye_y2 = y + sprite_height + 1;
		
		//show_debug_message("Y's reset to: "+string(y)+": "+string(eye_y1)+","+string(eye_y2));
	}
	//EXTRA for bottom-right/bottom-left fiends
	if place_meeting(x, y, obj_wall) == true && 
			place_meeting(x, y+1, obj_wall) == false//to compensate for change in collision box
			y+=1;
	if (real_x_spd<0) // moving left
	{
		if abs(real_x_spd)>=abs(real_y_spd){//to prevent jitter along vertical walls
			eye_x1 = x - 16 -  abs(sprite_width/2) ;//left boundary
			eye_x2 = x -  abs(sprite_width/2); //right boundary
			if (sprite_index != left_sprite) sprite_index = left_sprite;//turning left
		}
		//x-= sprite_width;
		if place_meeting(x, y, obj_wall) == true && 
			place_meeting(x+1, y, obj_wall) == false//to compensate for change in collision box
			x+=1;
	}
	else if (real_x_spd>0) //moving right
	{
		if abs(real_x_spd)>=abs(real_y_spd){//to prevent jitter along vertical walls
			if (sprite_index != right_sprite) sprite_index = right_sprite;
			eye_x1 = x + sprite_width/2;
			eye_x2 = x + sprite_width/2 + 16;
		}
		//show_debug_message("Righty X's changed to: "+string(x)+": "+string(eye_x1)+","+string(eye_x2));
		//x-= sprite_width;
		if place_meeting(x, y, obj_wall) == true && 
			place_meeting(x-1, y, obj_wall) == false//to compensate for change in collision box
			x-=1;
	}
	else if (real_y_spd != 0) { //just up or down -- not even needed anymore?
		eye_x1 = x -  abs(sprite_width)/2 - 1;
		eye_x2 = x + abs(sprite_width)/2 + 1;
		
		//show_debug_message("X's reset");//Last X's changed to: "+string(x)+": "+string(eye_x1)+","+string(eye_x2));
		
	}
	image_speed = 4;
}
/* INTERACTIONS */
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
	instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam),-6999,obj_pausemenu_main);
}
else if (framesToBuffer>0){
	framesToBuffer--;	
}
}
depth = -y;//primitive depth effects
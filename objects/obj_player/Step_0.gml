/// @description Insert description here
// You can write your code in this editor
right_key = keyboard_check(0x44);
left_key = keyboard_check(0x41);
up_key = keyboard_check(0x57);
down_key = keyboard_check(0x53);

x_spd = (right_key - left_key) * move_spd;
y_spd = (down_key - up_key) * move_spd;

//cheap pause effect
if instance_exists(obj_pauser)
	{
		x_spd = 0
		y_spd = 0
	}

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
	if ((y_spd<0)&&(sprite_index == spr_person1)) sprite_index = spr_person1_back;
	else if ((y_spd>0)&&(sprite_index == spr_person1_back)) sprite_index = spr_person1;
	if ((x_spd<0)&&(image_xscale != -1))
	{
		image_xscale = -1;
		//x-= sprite_width;
	}
	else if ((x_spd>0)&&(image_xscale == -1))
	{
		image_xscale = 1;
		//x-= sprite_width;
	}
	image_speed = 4;
}
x += x_spd
y += y_spd
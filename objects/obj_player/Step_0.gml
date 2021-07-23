/// @description Insert description here
// You can write your code in this editor
right_key = keyboard_check(0x44);
left_key = keyboard_check(0x41);
up_key = keyboard_check(0x57);
down_key = keyboard_check(0x53);

x_spd = (right_key - left_key) * move_spd;
y_spd = (down_key - up_key) * move_spd;

//collisions
if place_meeting(x + x_spd, y, obj_wall) == true
	{
		x_spd = 0;
	}
if place_meeting(x, y + y_spd, obj_wall) == true
	{
		y_spd = 0;
	}
x += x_spd
y += y_spd
/// @description Insert description here
// You can write your code in this editor
x_spd = 0;
y_spd = 0;
move_spd = 2.1;
paused = false;
framesToBuffer = 0;
checkReleased = true; //prevents interaction looping
inst = noone;
eye_x1 = x - abs(sprite_width/2) -  1;//top left corner
eye_y1 = y + sprite_height;
eye_x2 = x + abs(sprite_width/2) + 1;//top right corner
eye_y2 = y + sprite_height + 16;
//everything below this line should be based on currentParty[0]
front_sprite = spr_person1;
left_sprite = spr_person1_left;
right_sprite = spr_person1_right;
back_sprite = spr_person1_back;
/// @description Insert description here
// You can write your code in this editor
x_spd = 0;
y_spd = 0;
move_spd = 3;
paused = false;
framesToBuffer = 0;
checkReleased = true; //prevents interaction looping
locomode = 0;
inst = noone;
eye_x1 = x - abs(sprite_width/2) -  1;//top left corner
eye_y1 = y + sprite_height;
eye_x2 = x + abs(sprite_width/2) + 1;//top right corner
eye_y2 = y + sprite_height + 16;
//everything below this line should be based on currentParty[0]
set_sprites();
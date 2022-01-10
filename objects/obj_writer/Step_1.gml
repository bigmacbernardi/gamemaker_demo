/// @description Insert description here
myletter= string_char_at(currentLine, stringpos);
if(shake > 38) {
    speed= 2;
    direction+= 20;
}
if(shake == 42) {
    speed= 4;
    direction-= 19;
}
if(halt == 3 || dfy == 1) instance_destroy();
writingx = camera_get_view_x(cam) + xinterval;
writingy = camera_get_view_y(cam) + yinterval;

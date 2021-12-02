/// @description Should replace w/units drawing their own arrows, which is already set up
// You can write your code in this editor

for (var i = 0; i < array_length(targetSet1); i++){
	if (targetSet1[i]!=noone)draw_sprite(spr_select_right,0,targetSet1[i].x-7,targetSet1[i].y+3);
}
for (var i = 0; i < array_length(targetSet2); i++){
	if (targetSet2[i]!=noone)draw_sprite(spr_select_down,0,targetSet2[i].x+7,targetSet2[i].y-5);
}
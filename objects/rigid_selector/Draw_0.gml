/// @description Should replace w/units drawing their own arrows, which is already set up
// You can write your code in this editor

for (var i = 0; i < array_length_1d(targetSet1); i++){
	if (targetSet1[i]!=noone)draw_sprite(spr_indicator,0,targetSet1[i].x,targetSet1[i].y);
}
for (var i = 0; i < array_length_1d(targetSet2); i++){
	if (targetSet2[i]!=noone)draw_sprite(spr_indicator,0,targetSet2[i].x,targetSet2[i].y);
}
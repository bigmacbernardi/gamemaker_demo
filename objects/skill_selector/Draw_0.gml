/// @description Should replace w/units drawing their own arrows, which is already set up
// You can write your code in this editor

for (var i = 0; i < array_length(global.targets); i++){
	if (global.targets[i]!=noone)draw_sprite(spr_indicator,0,global.targets[i].x,global.targets[i].y);
}
/// @description Draws indicators? Replace w/units drawing their own arrows.
// You can write your code in this editor

for (var i = 0; i < array_length(global.targets); i++){
	if (global.targets[i]!=noone)draw_sprite(spr_select_right,0,global.targets[i].x-7,global.targets[i].y);
}


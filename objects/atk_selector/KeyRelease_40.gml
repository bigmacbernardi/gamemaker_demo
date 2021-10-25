/// @description Moves index "down"
// You can write your code in this editor
if (index == ds_list_size(global.enemies)-1) index = 0;
else index += 1;
global.targets = [global.enemies[|index]];
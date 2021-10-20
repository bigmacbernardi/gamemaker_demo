/// @description Moves index up
// You can write your code in this editor
if (index == 0) index = ds_list_size(global.enemies)-1;
else index -= 1;
/*while (global.enemies[|index].state == DEATH) // dead enemies are not in the "enemies" list, so get rid of the DEATH check.
index = abs(index - 1)%ds_list_size(global.enemies);*/
global.targets = global.enemies[|index];
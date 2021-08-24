/// @description Moves index up
// You can write your code in this editor

selectedIndex = abs((selectedIndex - 1)%ds_list_size(global.enemies));
while (global.enemies[|selectedIndex].state == DEATH)  selectedIndex = abs(selectedIndex - 1)%ds_list_size(global.enemies);
global.selectedTargets = global.enemies[|selectedIndex];
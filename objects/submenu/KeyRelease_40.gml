/// @description Moves index "down"
// You can write your code in this editor
selectedIndex = (selectedIndex + 1)%ds_list_size(global.enemies);
while (global.enemies[|selectedIndex].state == DEATH) selectedIndex = (selectedIndex + 1)%ds_list_size(global.enemies);
global.selectedTargets = global.enemies[|selectedIndex];
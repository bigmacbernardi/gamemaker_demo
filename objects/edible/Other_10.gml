/// @description Use by the user (Always outside of battle for edible, either for potable)
show_debug_message("Eating(?) "+title);
if (fixedRecovery) {
	global.points[global.targets[0]][HP] = min(global.party[global.targets[0]][HP],global.points[global.targets[0]][HP] + HPdelta);
	global.points[global.targets[0]][MP] = min(global.party[global.targets[0]][MP],global.points[global.targets[0]][MP] + MPdelta);
	}
else{
	global.points[global.targets[0]][HP] = min(global.party[global.targets[0]][HP],global.points[global.targets[0]][HP] + HPdelta*global.party[global.targets[0]][HP]);
	global.points[global.targets[0]][MP] = min(global.party[global.targets[0]][MP],global.points[global.targets[0]][MP] + MPdelta*global.party[global.targets[0]][MP]);
}
show_debug_message("Depleting from "+string(global.inventory[|global.itemInUse[1]][1])+" item #"+string(global.inventory[|global.itemInUse[1]][0]));
if (global.inventory[|global.itemInUse[1]][1]>1)
	global.inventory[|global.itemInUse[1]][1]--;
else ds_list_delete(global.inventory,global.itemInUse[1]);
show_debug_message("Use event complete");
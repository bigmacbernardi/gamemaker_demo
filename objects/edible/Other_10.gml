/// @description Use by the user (Always outside of battle for edible, either for potable)
show_debug_message("Eating(?) "+title);
if (fixedRecovery) {
	global.targets.current[HP] = min(global.targets.base[HP],global.targets.current[HP] + HPdelta);
	//global.targets.current[MP] += MPdelta;
}
else{
	global.targets.current[HP] = min(global.targets.base[HP],global.targets.current[HP] + HPdelta*global.targets.base[HP]);
	//global.targets.current[MP] += MPdelta*gloxbal.targets.base[MP];
}
show_debug_message("Depleting from "+string(global.inventory[|global.itemInUse[1]][1])+" item #"+string(global.inventory[|global.itemInUse[1]][0]));
if (global.inventory[|global.itemInUse[1]][1]>1)
	global.inventory[|global.itemInUse[1]][1]--;
else ds_list_delete(global.inventory,global.itemInUse[1]);
show_debug_message("Use event complete");
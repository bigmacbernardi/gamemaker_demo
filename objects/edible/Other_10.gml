/// @description Use by the user (Always outside of battle for edible, either for potable)
if (fixedRecovery) {
	global.targets.current[HP] += HPdelta;
	//global.targets.current[MP] += MPdelta;
}
else{
	global.targets.current[HP] += HPdelta*global.targets.base[HP];
	//global.targets.current[MP] += MPdelta*gloxbal.targets.base[MP];
}
if (global.inventory[|global.itemInUse[1]][1]>1)
	global.inventory[|global.itemInUse[1]][1]--;
else ds_list_delete(global.inventory,global.itemInUse[1]);
/// @description Checks if in battle to determine behavior
show_debug_message("Drinking "+title);
if instance_exists(battle_manager){
	/* point recovery */
	if (fixedRecovery) {
		global.targets[0].current[HP] = min(global.targets[0].base[HP],global.targets[0].current[HP] + HPdelta);
		global.targets[0].current[MP] = min(global.targets[0].base[MP],global.targets[0].current[MP] + MPdelta);
		
	}
	else{
		global.targets[0].current[HP] = min(global.targets[0].base[HP],global.targets[0].current[HP] + HPdelta*global.targets[0].base[HP]);
		global.targets[0].current[MP] = min(global.targets[0].base[MP],global.targets[0].current[MP] + HPdelta*global.targets[0].base[MP]);	
	}
	/* status recovery */
	if (specialProperties>-1){
		switch(specialProperties){
			case 0: global.targets[0].status[0]=(global.targets[0].status[0]>0?1:0);
					break;
			//case 1, 2: books, cannot be used in battle
			default: break;
		}
	}
	
} else{
	if (fixedRecovery) {
		global.points[global.targets[0]][HP] = min(global.party[global.targets[0]][HP],global.points[global.targets[0]][HP] + HPdelta);
		global.points[global.targets[0]][MP] = min(global.party[global.targets[0]][MP],global.points[global.targets[0]][MP] + MPdelta);
		}
	else{
		global.points[global.targets[0]][HP] = min(global.party[global.targets[0]][HP],global.points[global.targets[0]][HP] + HPdelta*global.party[global.targets[0]][HP]);
		global.points[global.targets[0]][MP] = min(global.party[global.targets[0]][MP],global.points[global.targets[0]][MP] + MPdelta*global.party[global.targets[0]][MP]);
	}
	
	/* status recovery */
	if (specialProperties>-1){
		switch(specialProperties){
			case 0: //cure poison
					global.statuses[global.targets[0]][0]=(global.statuses[global.targets[0]][0]>0?1:0);
					break;
			default: break;
		}
	}
}
show_debug_message("Depleting from "+string(global.inventory[|global.itemInUse[1]][1])+" item #"+string(global.inventory[|global.itemInUse[1]][0]));
if (global.inventory[|global.itemInUse[1]][1]>1)
	global.inventory[|global.itemInUse[1]][1]--;
else ds_list_delete(global.inventory,global.itemInUse[1]);

show_debug_message("Use event complete");
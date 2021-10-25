/// @description Initializing
// You can write your code in this editor

frameHasPassed = false;
lastMode = mode;
if (mode==0){ //not learning nested behavior so doing this instead
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = [global.enemies[|i]];
			break;
		}
	}
} else if (mode==1){ //not learning nested behavior so doing this instead
	global.targets = [global.allies[|0]];	
} else if (mode==2){
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets[i] = global.enemies[|i];
		}
	}
} else if (mode==2){
	for(var i = 0; i < ds_list_size(global.allies); i++){
		global.targets[i] = global.allies[|i];
	}
}
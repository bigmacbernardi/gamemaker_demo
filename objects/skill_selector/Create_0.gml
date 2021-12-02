/// @description Initializing
// You can write your code in this editor

frameHasPassed = false;
mode = global.selectMode;
lastMode = mode;
if (mode==0){ //ONE enemy

	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets = [global.enemies[|i]];
			currentMessage = global.enemies[|i].title;
			break;
		}
	}
		x = global.targets[0].x;
y = global.targets[0].y;

} else if (mode==1){ //ONE ally
	global.targets = [global.allies[|0]];
		x = global.targets[0].x;
y = global.targets[0].y;	
			currentMessage = global.allies[|0].title;
} else if (mode==2){//all enemies
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			global.targets[i] = global.enemies[|i];
		}
	}
	x = global.targets[0].x;
	y = global.targets[0].y;
	currentMessage = "All enemies";

} else if (mode==3){//all allies
	for(var i = 0; i < ds_list_size(global.allies); i++){
		global.targets[i] = global.allies[|i];
	}
	x = global.targets[0].x;
    y = global.targets[0].y;
	currentMessage = "All allies";

}
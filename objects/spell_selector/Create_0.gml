/// @description Initializing
// You can write your code in this editor
index = 0;
frameHasPassed = false;
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

} else if (floor(mode)==1){ //ONE ally
	if mode == 1{
		global.targets = [global.allies[|0]];
	}
	else if mode == 1.5{//revival
		for(var i = 0; i < 4; i++){
			if (global.currentParty[i]==noone){//none of the party's dead.  update later to account for overkill
				global.targets = [global.units[|0]];
				break;
			}
			else if (global.units[|i].state == DEATH){	        
				global.targets =  [global.units[|i]];
				break;
			}
		}
	}
	x = global.targets[0].x;
	y = global.targets[0].y;	
	currentMessage = global.targets[0].title;
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
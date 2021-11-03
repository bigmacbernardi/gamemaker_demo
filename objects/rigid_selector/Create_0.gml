/// @description What's funny about this is I think ONLY rigid selections could require two target groups!
// You can write your code in this editor
show_debug_message("Rigid selector showing");
frameHasPassed = false;
mode = global.selectMode;
lastMode = mode;
targetSet1 = [];
targetSet2 = [];
if (mode==0){ //enemies only
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			targetSet1[i] = global.enemies[|i];
		}
	}

}
else if (mode==1){ //allies only
	for(var i = 0; i < ds_list_size(global.allies); i++){
		targetSet1[i]  = global.allies[|i];
	}
}
else if (mode==2){//everybody
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){ 
			targetSet1[i] = global.enemies[|i];
		}
	}
	for(var i = 0; i < ds_list_size(global.allies); i++){
		targetSet2[i]  = global.allies[|i];
	}
}
else if (mode==3){//self only - means this has to be called for solo skills too
	targetSet1 = [global.selectedUnit];
}
else if (mode==4){//TEAM only
	targetSet1 = [global.selectedUnit,global.selectedUnit.teammate];
}
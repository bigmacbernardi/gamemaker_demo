/// @description What's funny about this is I think ONLY rigid selections could require two target groups!
// You can write your code in this editor
//show_debug_message("Rigid selector showing");
frameHasPassed = false;
mode = global.selectMode;
targetSet1 = [];
targetSet2 = [];
if (mode==0){ //enemies only
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		if (global.enemies[|i].state != DEATH){
	        
			targetSet1[i] = global.enemies[|i];
		}
	}
	
	currentMessage = "All enemies";
}
else if (mode==1){ //allies only
	for(var i = 0; i < ds_list_size(global.allies); i++){
		targetSet1[i]  = global.allies[|i];
	}
		currentMessage="All allies";
}
else if (mode==2){//everybody
	for(var i = 0; i < ds_list_size(global.enemies); i++){
		//if (global.enemies[|i].state != DEATH){ //not needed!
			targetSet1[i] = global.enemies[|i];
		//}
	}
	for(var i = 0; i < ds_list_size(global.allies); i++){
		targetSet2[i]  = global.allies[|i];
	}
	currentMessage="Both sides";
}
else if (mode==3){//self only - means this has to be called for solo skills too
	targetSet1 = [global.selectedUnit];
	currentMessage=global.selectedUnit.title+" (Self)";
}
else if (mode==4){//TEAM only
	targetSet1 = [global.selectedUnit,global.selectedUnit.teammate];
	currentMessage=global.selectedUnit.title+" and "+global.selectedUnit.teammate.title;//if teammate is dead or N/A, shouldn't be usable!
}
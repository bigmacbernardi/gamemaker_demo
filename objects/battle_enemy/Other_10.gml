/// @description Takes its turn
show_debug_message(global.selectedUnit.title + "("+string(current[@ HP])+"/"+string(base[@ HP])+") turn");
var checkList = (isPlayer ? global.enemies : global.allies);
for(var i = 0; i < ds_list_size(checkList); i++){
	if (checkList[|i].state != DEATH){
		global.targets = checkList[|i];
		break;
		}
}
show_debug_message(global.selectedUnit.title + " attack "+global.targets.title);
state = ATTACK; 
layer_sequence_headpos(unitSequence,atkStart);

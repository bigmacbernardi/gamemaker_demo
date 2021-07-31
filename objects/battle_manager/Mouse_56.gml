/// @description Insert description here
// You can write your code in this editor
if (allowInput){
	with (global.selectedUnit){
		state = ATTACK; 
		layer_sequence_headpos(unitSequence,atkStart);
		for(var i = 0; i < ds_list_size(global.units); i++){
			if (global.units[|i] != global.selectedUnit){
				global.selectedTargets = global.units[|i];
				break;
			}
		}
	}
	allowInput = false;
}
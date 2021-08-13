// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulateInput(){
			with (global.selectedUnit){
			    show_debug_message("Only if enemy (with "+string(current[@ HP])+"/"+string(base[@ HP])+") attacks");
				var checkList = (isPlayer ? global.enemies : global.allies);
				for(var i = 0; i < ds_list_size(checkList); i++){
					if (checkList[|i].state != DEATH){
						global.selectedTargets = checkList[|i];
						break;
						}
				}
				state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
			}	
}
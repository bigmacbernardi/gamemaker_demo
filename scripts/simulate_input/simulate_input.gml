// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulateInput(){
			with (global.selectedUnit){//string_copy(string(global.selectedUnit),6,5)
			    show_debug_message(global.selectedUnit.title + "("+string(current[@ HP])+"/"+string(base[@ HP])+") turn");
				var checkList = (isPlayer ? global.enemies : global.allies);
				for(var i = 0; i < ds_list_size(checkList); i++){
					if (checkList[|i].state != DEATH){
						global.targets = [checkList[|i]];
						break;
						}
				}
			    show_debug_message(global.selectedUnit.title + " attack "+global.targets[0].title);
				state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
			}	
}
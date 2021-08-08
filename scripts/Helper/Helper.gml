// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}

function simulateInput(){
			with (global.selectedUnit){
				for(var i = 0; i < ds_list_size(global.allies); i++){
					if (global.allies[|i].state != DEATH){
						global.selectedTargets = global.allies[|i];
						break;
						}
				}
				state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
			}	
}

function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	if (number > unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}

function unitAttack(){
	var unit = global.selectedUnit;
	if (unit.attackWillHit){
		with(global.selectedTargets){
				incomingDamage = unit.current[@ ATK];
				state = HIT;
				layer_sequence_headpos(unitSequence,hitStart);
		}
	}
	else{
		with(global.selectedTargets){
			state = MISS;
			layer_sequence_headpos(unitSequence,missStart);
		}
	}
	
}


// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}


function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}

function unitAttack(){
	show_debug_message("Unit attacking");
	var unit = global.selectedUnit;
	if (unit.attackWillHit){
		with(global.selectedTargets){
				incomingDamage = unit.current[@ ATK] ;
				state = HIT;
				layer_sequence_headpos(unitSequence,hitStart);
		}
	}
	else{
		with(global.selectedTargets){
			state = MISS;
			if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
			layer_sequence_headpos(unitSequence,missStart);
		}
	}
	
}


// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}


/*function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}*/

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

function useItem(){
	show_debug_message(global.selectedUnit.title+" using "+ global.itemInUse[0].title +" on " + global.targets[0].title);
	/*	with(global.targets[0]){
			state = MISS;
			//getting-healed animation?
		}*/
	
}
function unitAttack(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets[0].title+"#"+string(global.targets[0]));
	var unit = global.selectedUnit;
	if (unit.attackWillHit){
		for (var i = 0; i < array_length(global.targets); i++){ //should recalculate and put outside, but that's not how attack works rn
			with(global.targets[i]){
					incomingDamage = unit.current[@ STR] ;
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					state = HIT;
					layer_sequence_headpos(unitSequence,hitStart);
			}
		}
	}
	else{
		for (var i = 0; i < array_length(global.targets); i++){
			with(global.targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				state = MISS;
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
			}
		}
	
	}

}
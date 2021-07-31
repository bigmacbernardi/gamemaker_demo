// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

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
}
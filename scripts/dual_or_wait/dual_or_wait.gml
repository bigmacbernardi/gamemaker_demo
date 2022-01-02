// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dual(){
	var inst = instance_create_depth(0, button_attack.y-90,-90, obj_dualmenu);
	//change list to skills
	inst.priorMenu = button_dual_wait;
}
function wait(){
	var unit = global.selectedUnit;
	with unit{
		turnFinished = true;	
	}
	with battle_manager{
		enqueue(unit,pq[1][0]+1);	
		alarm[1]=10;
	}
}
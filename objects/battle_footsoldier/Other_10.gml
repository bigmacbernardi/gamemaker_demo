/// @description If MP>3, rolls die for 1/3 chance of "big shot," doing extra damage to all enemies.  Otherwise, shoots player with lowest HP.

if (current[MP]>3){
	var roll = irandom_range(1,3);
	show_debug_message("Soldier rolled a "+string(roll));
	doingSpecialAttack = (roll == 3);
}
else doingSpecialAttack = false;
if doingSpecialAttack{
	current[MP]-=3;
	show_debug_message("pizza time");
	
	//var checkList = (isPlayer ? global.enemies : global.allies);
	for(var i = 0; i < ds_list_size(global.allies); i++){
		global.targets[i] = global.allies[|i];
	}
	layer_sequence_headpos(unitSequence,atk2Start);
}
else{
	var minHP = 9999;
	var minI = 0;
	for(var i = 0; i < ds_list_size(global.allies); i++){
		if (global.allies[|i].current[HP]<minHP){
			minHP = global.allies[|i].current[HP];
			minI = i;
		}
	}
	global.targets = [global.allies[|minI]];
	//show_debug_message(global.selectedUnit.title + " attack "+global.targets[0].title);
	layer_sequence_headpos(unitSequence,atkStart);
	
}
state = ATTACK; 
audio_play_sound(swingSound,50,false); //gun
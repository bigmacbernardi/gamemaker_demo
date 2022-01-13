/// @description If MP>4, rolls die for special
/*if (hasGoneOnce && current[MP]>4){
	var roll = irandom_range(1,6);
	show_debug_message("Beast rolled a "+string(roll));
	doingSpecialAttack = (roll > 4);
}
else{
	hasGoneOnce = true;
    doingSpecialAttack = false;
}
if doingSpecialAttack{
	current[MP]-=4;
	current[STR] = 20;
	
	var i = irandom(ds_list_size(global.allies)-1);
	show_debug_message("pizza time: "+string(i));
	global.targets = [global.allies[|i]];
	layer_sequence_headpos(unitSequence,atk2Start);
}
else{
	current[STR] = base[STR];*/
	var i = irandom(ds_list_size(global.allies)-1);
	show_debug_message("normal time: "+string(i));
	global.targets = [global.allies[|i]];
	//show_debug_message(global.selectedUnit.title + " attack "+global.targets[0].title);
	layer_sequence_headpos(unitSequence,atkStart);
	
//}
state = ATTACK; 
audio_play_sound(swingSound,50,false); //gun
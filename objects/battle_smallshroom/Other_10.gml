/// @description Rolls die to pick target.  If target not poisoned and MP>1, attempts to poison target
//select random target
var target = global.allies[|irandom(ds_list_size(global.allies)-1)];
global.targets=[target];
//if target not poisoned, attempt to poison
if target.status[0] == 0 and (current[MP]>=1){
	//var roll = irandom_range(1,6);
	//show_debug_message("Shroom rolled a "+string(roll));
	current[MP]--;
	if target.immunity[8]<1//no poison immunity
		target.status[0]-=/*poison damage*/2;
	//doingSpecialAttack = (roll > 4);
}
else if target.status[0] == 1 and (current[MP]>=1){
	//var roll = irandom_range(1,6);
	//show_debug_message("Shroom rolled a "+string(roll));
	current[MP]--;
	if target.immunity[8]<1//no poison immunity
		target.status[0]+=/*poison damage*/2;
}
layer_sequence_headpos(unitSequence,atkStart);
state = ATTACK; 
audio_play_sound(swingSound,50,false); //gun
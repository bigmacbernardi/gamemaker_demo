/// @description Insert description here
// You can write your code in this editor
if action != noone{
	action();
	if phasesRemaining-- > 0{
		action = noone; //wait; should act as semaphore
	}
	else{
		//maybe trigger next step
		instance_destroy();
	}
}
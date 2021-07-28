/// @description Insert description here
// You can write your code in this editor
switch(combatPhase){
	case phase.init:
		combatPhase = phase.startTurn;
	break;
	
	case phase.startTurn:
		combatPhase = phase.wait;
	break;
	
	case phase.wait:
		combatPhase = phase.process;
	break;
	
	case phase.process:
		combatPhase = phase.checkFinish;
	break;
	
	case phase.checkFinish:
		if(keyboard_check_released(vk_space))
			combatPhase = phase.endTurn;
		if(keyboard_check_released(vk_enter))
			combatPhase = phase.win;
		if(keyboard_check_released(vk_control))
			combatPhase = phase.lose;
	break;
	
	case phase.endTurn:
		combatPhase = phase.startTurn;
	break;
	
	case phase.win:
	//return to previous room
	break;
	
	case phase.lose:
	//game over
	break;
}
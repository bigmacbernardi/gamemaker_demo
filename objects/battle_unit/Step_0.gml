// state machine that determines the unit's animation
switch(state){
	case IDLE:
		if (layer_sequence_get_headpos(unitSequence) > idleEnd){
			layer_sequence_headpos(unitSequence, idleStart);
		}
	
	break
	
	case ATTACK:
		if (layer_sequence_get_headpos(unitSequence) > atkEnd){
			turnFinished = true;
			layer_sequence_headpos(unitSequence, atkStart);
			state = IDLE;
		}
	
	break;
	
	//no MISS or HURT animations right now
	case MISS:
		state = IDLE;
	break;
	
	case HIT:
		state = IDLE;
	break;
	
	case TODEFEND:
		if (layer_sequence_get_headpos(unitSequence) > intoDefEnd){
				layer_sequence_headpos(unitSequence, defStart);
				state = DEFEND;
			}
	break;
	
	case DEFEND:
		if (layer_sequence_get_headpos(unitSequence) > defEnd){
				layer_sequence_headpos(unitSequence, defStart);
			}
	break;
}
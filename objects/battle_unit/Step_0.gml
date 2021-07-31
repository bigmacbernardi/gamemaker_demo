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
			if (attackWillHit){
				layer_sequence_headpos(unitSequence, idleStart);
				state = IDLE;
			}
			else{
				layer_sequence_headpos(unitSequence, missStart);
				state = MISS;
			}
		}
	
	break;
	
	//no MISS or HURT animations right now
	case MISS:
			if (layer_sequence_get_headpos(unitSequence) > missEnd){
				layer_sequence_headpos(unitSequence, idleStart);
				state = IDLE;
			}
	break;
	
	case HIT:
		if (layer_sequence_get_headpos(unitSequence) > hitEnd){
				damageUnit(incomingDamage);
				if (current[@ HP] > 0){
					layer_sequence_headpos(unitSequence, idleStart);
					incomingDamage = 0;
					state = IDLE;
				}
				else{
					layer_sequence_headpos(unitSequence, deathStart);
					ds_list_delete(global.units,ds_list_find_index(global.units,id));
					state = DEATH;
				}
			}
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
	
	case DEATH:
		if (layer_sequence_get_headpos(unitSequence) > deathEnd){
			instance_destroy();
		}
	break;
}
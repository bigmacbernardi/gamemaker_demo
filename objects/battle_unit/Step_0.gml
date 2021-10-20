// state machine that determines the unit's animation
switch(state){
	case IDLE:
		if (layer_sequence_get_headpos(unitSequence) > idleEnd){
			layer_sequence_headpos(unitSequence, idleStart);
		}
	
	break
	
	case ATTACK:
		if (layer_sequence_get_headpos(unitSequence) > atkEnd){
			show_debug_message("Attack animation finished");
			//at THIS point damage should happen right?
			turnFinished = true;
			//if (attackWillHit){
			//	layer_sequence_headpos(unitSequence, idleStart);
			state = IDLE;
			//}
			//else{
			//	layer_sequence_headpos(unitSequence, missStart);
			//	state = MISS;
			//}
		}
	
	break;

	case ITEM:
		if (layer_sequence_get_headpos(unitSequence) > itmEnd){
			show_debug_message("Item animation finished");
			//at THIS point damage should happen right?
			turnFinished = true;
			//layer_sequence_headpos(unitSequence, itmStart);
			state = IDLE;
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
		show_debug_message(title + string(id) + " got hit!!!");
		if (layer_sequence_get_headpos(unitSequence) > hitEnd){
				show_debug_message("here comes the damage!!!");
				damageUnit(incomingDamage);
				if (current[@ HP] > 0){
					layer_sequence_headpos(unitSequence, idleStart);
					incomingDamage = 0;
					state = IDLE;
				}
				else{
					layer_sequence_headpos(unitSequence, deathStart);
					if (isPlayer){
						show_debug_message("Player Killed");
						ds_list_delete(global.allies,ds_list_find_index(global.allies,id));
					}
					else{
						show_debug_message("Enemy Killed");
						ds_list_delete(global.enemies,ds_list_find_index(global.enemies,id));
					}
					turnFinished = true;
					state = DEATH;
					if (ds_priority_find_priority(battle_manager.pq,id)!=undefined) ds_priority_delete_value(battle_manager.pq,id);
				}
			}
			else show_debug_message("hit end already happened!  probably a sequencing issue");
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
			layer_sequence_headpos(unitSequence,deathMid);
		}
	break;
}
// state machine that determines the unit's animation
switch(state){
	case IDLE:
		if (layer_sequence_get_headpos(unitSequence) > idleEnd){
			layer_sequence_headpos(unitSequence, idleStart);
		}
	
	break
	
	case ATTACK:
		if (layer_sequence_get_headpos(unitSequence) > atkEnd){
			var myId = id;
			show_debug_message(title+" attack animation finished");
			//at THIS point damage should happen right?
			turnFinished = true;
			//if (attackWillHit){
			//	layer_sequence_headpos(unitSequence, idleStart);
			state = IDLE;//NEW stuff below this line
			//broadcast manager do the following
			/*battle_manager.enqueue(id);//i guess?
			if id==global.selectedUnit battle_manager.selectedFinished = true;*/
			//}
			//else{
			//	layer_sequence_headpos(unitSequence, missStart);
			//	state = MISS;
			//}
			with battle_manager{
				enqueue(myId);	
			}
		}
	
	break;

	case ITEM:
		if (layer_sequence_get_headpos(unitSequence) > itmEnd){
			show_debug_message("Item animation finished");
			var myId = id;
			//at THIS point damage should happen right?
			turnFinished = true;
			//layer_sequence_headpos(unitSequence, itmStart);
			state = IDLE;
			/*broadcast should do the following*/
			
			with battle_manager{
				enqueue(myId);	
			}
			//if id==global.selectedUnit battle_manager.selectedFinished = true; //i guess? figure this out

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
		//show_debug_message(title + string(id) + " is hit!!!");
		if (layer_sequence_get_headpos(unitSequence) > hitEnd){
				show_debug_message("here comes the damage!!!");
				damageUnit(incomingDamage);
				if (current[@ HP] > 0){
					layer_sequence_headpos(unitSequence, idleStart);
					incomingDamage = 0;
					state = IDLE;
				}
				else{
					var myId = id;
					layer_sequence_headpos(unitSequence, deathStart);
					if (isPlayer){//could probably just make this battle_player behavior
						show_debug_message("Player Killed");
						ds_list_delete(global.allies,ds_list_find_index(global.allies,id));
					}
					else{//could probably just make this battle_enemy behavior
						show_debug_message("Enemy Killed");
						battle_manager.expEarned += xp_value; //naive!  doesn't account for resurrection and assumes xp_value exists
						battle_manager.cashEarned += cash_value; //ditt'
						ds_list_delete(global.enemies,ds_list_find_index(global.enemies,id));
					}
					turnFinished = true;
					state = DEATH;
					
					with battle_manager{
						remove(myId);	
					}
					//if (ds_priority_find_priority(battle_manager.pq,id)!=undefined) ds_priority_delete_value(battle_manager.pq,id);
					//battle_manager.remove(id); //let broadcast manager do this too!				
				}
			}
			//else show_debug_message("hit end HAS NOT happened yet! "+string(layer_sequence_get_headpos(unitSequence))+" vs "+string(hitEnd));
	break;
	case HEAL://also to be used for buffs (and debuffs?)
		show_debug_message(title + string(id) + "is healing!");
		if (layer_sequence_get_headpos(unitSequence) > hitEnd){//delay is apparently needed for sequencing with battle_manager
		healUnit(incomingDamage);
		layer_sequence_headpos(unitSequence, idleStart);
		incomingDamage = 0;
		state = IDLE;
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
		//var myId = id;
		if (layer_sequence_get_headpos(unitSequence) > deathEnd){
			layer_sequence_headpos(unitSequence,deathMid);
			/*with battle_manager{//just making sure?
				remove(myId);	
			}*/
		}
	break;
}
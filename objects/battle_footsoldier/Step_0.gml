/// @description Insert description here
// You can write your code in this editor
// state machine that determines the unit's animation
switch(state){
	case IDLE:
		if (layer_sequence_get_headpos(unitSequence) > idleEnd){
			layer_sequence_headpos(unitSequence, idleStart);
		}
	
	break
	
	case ATTACK:
		if (layer_sequence_get_headpos(unitSequence) > (doingSpecialAttack?atk2End:atkEnd)){
			//var myId = id;
			//show_debug_message(title+" attack animation finished");
			//at THIS point damage should happen right?
			turnFinished = true;
			//if (attackWillHit){
			//	layer_sequence_headpos(unitSequence, idleStart);
			state = IDLE;//NEW stuff below this line
			/*with battle_manager{enqueue(myId);}*///should be done by unitAttack
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
				enqueue(myId);//ITEM
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
		//show_debug_message(title + string(id) + " is hit!!!");
		if (layer_sequence_get_headpos(unitSequence) > hitEnd){
				show_debug_message("damage that footsoldier!!!");
				damageUnit(incomingDamage);
				if (current[@ HP] > 0){
					layer_sequence_headpos(unitSequence, idleStart);
					incomingDamage = 0;
					state = IDLE;
				}
				else{
					var myId = id;
					layer_sequence_headpos(unitSequence, deathStart);
					audio_play_sound(guydies,100,0);
					show_debug_message("Soldier killed");
					battle_manager.expEarned += xp_value; //naive!  doesn't account for resurrection and assumes xp_value exists
					battle_manager.cashEarned += cash_value; //ditt'
					ds_list_delete(global.enemies,ds_list_find_index(global.enemies,id));
					turnFinished = true;
					state = DEATH;
					
					with battle_manager{
						remove(myId);
						totalUnits--;	
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
// state machine that determines the unit's animation
if variable_instance_exists(id,showMe)&&showMe>0{
	if --showMe<=0{
		incomingHealage=0;
		nastyDamage=0;
	}
}
switch(state){
	case IDLE:
		if (layer_sequence_get_headpos(unitSequence) > idleEnd){
			layer_sequence_headpos(unitSequence, idleStart);
		}
	break
	
	case ATTACK:
	if movesIn and global.targets[0]>0{
		var halfDone = (atkStart+atkEnd)/2;
		var momento = layer_sequence_get_headpos(unitSequence);
		if (momento<=halfDone){		
			//var bit = (momento-atkStart)/(halfDone-atkStart);
			//layer_sequence_x(unitSequence,lerp(root_x,global.targets[0].x,bit));
			//layer_sequence_y(unitSequence,lerp(root_y,global.targets[0].y,bit));
			layer_sequence_x(unitSequence,lerp(layer_sequence_get_x(unitSequence),global.targets[0].x,.1));
			layer_sequence_y(unitSequence,lerp(layer_sequence_get_y(unitSequence),global.targets[0].y+global.targets[0].sprite_height/2,.1));
		}
		else if momento>(halfDone+5){
			//var bit = (momento-halfDone)/(atkEnd-halfDone);
			//layer_sequence_x(unitSequence,lerp(root_x,global.targets[0].x,bit));
			//layer_sequence_y(unitSequence,lerp(root_y,global.targets[0].y,bit));
			layer_sequence_x(unitSequence,lerp(layer_sequence_get_x(unitSequence),root_x,.3));
			layer_sequence_y(unitSequence,lerp(layer_sequence_get_y(unitSequence),root_y,.3));
		}
	}
	if (layer_sequence_get_headpos(unitSequence) > atkEnd){
		layer_sequence_x(unitSequence,root_x);
		layer_sequence_y(unitSequence,root_y);
		var myId = id;
		//show_debug_message(title+" attack animation finished");
		//at THIS point damage should happen right?
		turnFinished = true;
		//if (attackWillHit){
		//	layer_sequence_headpos(unitSequence, idleStart);
		state = IDLE;
		//with battle_manager{enqueue(myId);} //already done by unitAttack!
	}
	break;

	case ITEM:
		if (layer_sequence_get_headpos(unitSequence) > itmEnd){
			show_debug_message("Item animation finished");
			var myId = id;
			//at THIS point damage should happen right?
			turnFinished = true;
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
			show_debug_message("here comes the "+string(incomingDamage)+" damage!!!");
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
					totalUnits--;	
				}
				//if (ds_priority_find_priority(battle_manager.pq,id)!=undefined) ds_priority_delete_value(battle_manager.pq,id);
				//battle_manager.remove(id); //let broadcast manager do this too!				
			}
		}//else show_debug_message("hit end HAS NOT happened yet! "+string(layer_sequence_get_headpos(unitSequence))+" vs "+string(hitEnd));
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
	case SPECIAL:
	if (layer_sequence_get_headpos(unitSequence) >= spcEnd){//NO BROADCAST
			show_debug_message("Special animation finished");
			var myId = id;
			//layer_sequence_headpos(unitSequence, idleStart);
			state = IDLE;			
			turnFinished = true;
			//with battle_manager{enqueue(myId);} //already done by unitAttack OR special func
		
			
		}
	break;
}
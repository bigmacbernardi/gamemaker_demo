if (event_data[? "event_type"] == "sequence event"){
show_debug_message("Broadcast received: '"+event_data[? "message"]+"'");
    switch(event_data[? "message"]){
		case "attackSent":
			//enqueue(layer_instance_get_instance(event_data[? "element_id"]));
			selectedFinished = true;
			if !global.selectedUnit.isPlayer{processFinished = true;//just do this
			atkBroadcasts++;}
		break;
		case "itemUsed": //for all i know, this could work as the same case as the above
			show_debug_message("Item broadcast received");
			//enqueue(layer_instance_get_instance(event_data[? "element_id"]));
			selectedFinished = true;
			processFinished = true;
			itmBroadcasts++;
		break;
		case "unitMiss":
			//selectedFinished = true;//self-attack workaround;  think i fixed in unit attack
		case "unitHurt":
		case "unitHit"://i think we may have accidentally called it both
			processFinished = true;
			hitMissBroadcasts++;
		break;
		
		case "playerDeath":
		break;
		case "enemyDeath": //remove(layer_instance_get_instance(event_data[? "element_id"]));
			processFinished = true;
			deathBroadcasts++;
		break;
	}
}
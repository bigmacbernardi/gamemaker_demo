if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "attackSent":
			//show_debug_message(layer_instance_get_instance(event_data[? "element_id"]).title + "'s attack broadcast received");
			//enqueue(layer_instance_get_instance(event_data[? "element_id"]));
			selectedFinished = true;
		break;
		case "itemUsed": //for all i know, this could work as the same case as the above
			show_debug_message("Item broadcast received");
			//enqueue(layer_instance_get_instance(event_data[? "element_id"]));
			selectedFinished = true;
			processFinished = true;
		break;
		case "unitMiss":
		case "unitHurt":
			processFinished = true;
		break;
		
		case "playerDeath":
		case "enemyDeath": //remove(layer_instance_get_instance(event_data[? "element_id"]));
		break;
	}
}
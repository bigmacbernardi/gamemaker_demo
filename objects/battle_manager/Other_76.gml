if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "attackSent":
			selectedFinished = true;
		break;
		case "itemUsed": //for all i know, this could work as the same case as the above
			show_debug_message("Item broadcast received");
			selectedFinished = true;
			processFinished = true;
		break;
		case "unitMiss":
		case "unitHurt":
			processFinished = true;
		break;
		
		case "playerDeath":
		case "enemyDeath":
		break;
	}
}
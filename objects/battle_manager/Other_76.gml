if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "attackSent":
			selectedFinished = true;
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
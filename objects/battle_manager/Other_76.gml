if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "attackSent":
			selectedFinished = true;
			//if(!global.selectedUnit.attackWillHit){
			//	processFinished=true;
			//}
		break;
		
		case "unitMiss":
		case "unitHurt":
			processFinished = true;
		break;
		
		case "playerDeath":
			checkCompletion = true;
			checkParty = true;
		break;
		
		case "enemyDeath":
			checkCompletion = true;
		break;
	}
}
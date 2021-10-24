/// @description Continuous (continual) battle management functionality
switch(combatPhase){
	
	case phase.init:
		var characters = [battle_aoi,battle_yusuf]; //declare in inner scope so it's not held?
		for (var i = 0; i<4;i++){//4 global.currentParty slots
			if (global.currentParty[i] != noone) {
				var next_char = characters[global.currentParty[i]];
				//var next_id = instance_create_layer((i%2)==0?16:32,200-(i*64),"Instances",next_char);
				var unit = instance_create_depth((i%2)==0?16:32,140-(i*60),0,next_char);
				ds_list_add(global.units,unit);
				ds_priority_add(pq,unit,getWait(unit));
				ds_list_add(global.allies,unit);
				unit.isPlayer = true;
			}
		}
		for (var i = 0; i < instance_number(battle_spawner); i++){
			var spawner = instance_find(battle_spawner, i);
			if (!spawner.isPlayer){ //regular
				var unit = instance_create_depth(spawner.x,spawner.y,0,spawner.unit);
				ds_list_add(global.units,unit);
				ds_priority_add(pq,unit,getWait(unit));
				//show_debug_message("Queued "+unit.title+" with priority "+string(getWait(unit)));
				ds_list_add(global.enemies,unit);
			}
			else{
				//spawner.event_user(0); //bc it's player_spawner.  dumb
				//ignore, shouldn't exist anymore
			}
		}
		//enemy spawner
		for (var i = 0; i < array_length(global.foesToSpawn); i+=3){
			var unit = instance_create_depth(global.foesToSpawn[i+1],global.foesToSpawn[i+2],0,global.foesToSpawn[i])
			ds_list_add(global.units,unit);
			ds_priority_add(pq,unit,getWait(unit));
			ds_list_add(global.enemies,unit);
		}
		combatPhase = phase.startTurn;
	break;
	
	case phase.startTurn:
		show_debug_message("Turn Start");
		if (ds_list_empty(global.enemies) || ds_list_empty(global.allies)){
			show_debug_message("One team has been eliminated");
			combatPhase = phase.checkFinish;
			break;
		}
		//this is where you would sort the list of units, based on SPD attribute or whatever else
		
		//if there are as many unitsFinished as units, reset everyone's turnFinished status
		if (unitsFinished >= ds_list_size(global.units)){
			for(var i = 0;i < ds_list_size(global.units);i++){
				with(global.units[|i]){
					if !(state == DEATH)
						turnFinished = false;

				}
			}
			unitsFinished = 0;
		}
		
		//cycle through the units and find the first w/ turnFinished FALSE
		//change unit's local selected status (draws indicator) and make it the selectedUnit
		var inst = ds_priority_delete_min(pq); //needs corresponding ds_priority_add in later phase
		//if (inst.turnFinished||inst.state != DEATH) then it shouldn't be in queue
		inst.selected = true;
		global.selectedUnit = inst;
		//old list-looping method used:	if ((!inst.turnFinished)&&(inst.state != DEATH))
		if (global.selectedUnit.isPlayer){  //do check if dual technique is possible HERE
			solicitInput = false;
			allowInput = true;
			//maybe just have a single method for menu show/hide
			button_attack.visible = 1;
			button_skill.visible = 1;
			button_item.visible = 1;
			show_debug_message("Showing menu button");
			//menu = create_button(0,200,280,80,"Attack",simulateInput(global.enemies));
		}
		else {
		    //allowInput = false; //just in case
			solicitInput = true;
		}
		combatPhase = phase.wait;
			
	break;
	
	case phase.wait:
		if (solicitInput){
			show_debug_message("Running AI");
			with global.selectedUnit{
				event_user(0);
			}
			solicitInput = false;
		}
		if (ds_list_empty(global.enemies)){
			global.selectedUnit.selected = false;
			global.selectedUnit.turnFinished = true;
			unitsFinished++;
			combatPhase = phase.win;
		}
		else if (selectedFinished){
			//show_debug_message("Selected ("+global.selectedUnit.title+") Finished");
			global.selectedUnit.selected = false;
			global.selectedUnit.turnFinished = true;
			unitsFinished++;
			combatPhase = phase.process;
			//requeue
			var nextPriority = ds_priority_find_priority(pq,ds_priority_find_max(pq))+getWait(global.selectedUnit); //this process will need to change for overflow reasons
			show_debug_message("Requeuing "+global.selectedUnit.title+" with priority "+string(nextPriority));
			ds_priority_add(pq,global.selectedUnit,nextPriority);
		}
	break;
	
	case phase.process:
		//show_debug_message("Processing");
		if (processFinished){
			show_debug_message("Process step finished");
			combatPhase = phase.checkFinish;
		}
		
		
	break;
	
	case phase.checkFinish:
		show_debug_message("Checking for the end of states");
		if (ds_list_empty(global.allies)){
			combatPhase = phase.lose;
			break;
		}
		else if (ds_list_empty(global.enemies)){
			combatPhase = phase.win;
			break;
		}
		processFinished = false;
		combatPhase = phase.endTurn;

	break;
	
	case phase.endTurn:
		selectedFinished = false;
		//global.targets.path_speed = 0;
		global.targets = noone;
		combatPhase = phase.startTurn;
	break;
	
	case phase.win:
		show_debug_message("You win!");
		global.foesToSpawn = [];
		for (var i = 0; i<ds_list_size(global.allies);i++){//if allies are deleted from allies then mayyybe this ain't the best idea lol
			global.points[global.currentParty[i]][HP] = global.allies[|i].current[HP];
			global.points[global.currentParty[i]][MP] = global.allies[|i].current[MP];
			global.party[global.currentParty[i]][XP] += expEarned;
		}
		room_goto(global.returnRoom);//orig Room1
	//return to previous room
	break;
	
	case phase.lose:
		show_debug_message("You lose...");
		global.foesToSpawn = [];
		room_goto(gameover);
	//game over
	break;
}
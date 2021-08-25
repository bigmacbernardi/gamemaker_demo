
switch(combatPhase){
	case phase.init:
		for (var i = 0; i < instance_number(battle_spawner); i++){
			var spawner = instance_find(battle_spawner, i);
			var unit = instance_create_depth(spawner.x,spawner.y,0,spawner.unit)
			ds_list_add(global.units,unit);
			ds_priority_add(pq,unit,getWait(unit));
			if (spawner.isPlayer){
				ds_list_add(global.allies,unit);
				unit.isPlayer = true;
			}
			else
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
		//old list-looping method
		/*for (var i = 0; i < ds_list_size(global.units); i++){
			var inst = global.units[|i];
			if ((!inst.turnFinished)&&(inst.state != DEATH)){
				inst.selected = true;
				global.selectedUnit = inst;
				break;
			}
		} */ 
		if (global.selectedUnit.isPlayer){
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
			simulateInput();		
			solicitInput = false;
		}
			
		if (selectedFinished){
			show_debug_message("Selected Finished");
			global.selectedUnit.selected = false;
			global.selectedUnit.turnFinished = true;
			unitsFinished++;
			combatPhase = phase.process;
		}
	break;
	
	case phase.process:
		if (processFinished){
			show_debug_message("Process Finished");
			combatPhase = phase.checkFinish;
		}
	break;
	
	case phase.checkFinish:
		show_debug_message("Checking for end-states");
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
		//global.selectedTargets.path_speed = 0;
		global.selectedTargets = noone;
		combatPhase = phase.startTurn;
	break;
	
	case phase.win:
		show_debug_message("You win!");
	//return to previous room
	break;
	
	case phase.lose:
		show_debug_message("You lose...");
	//game over
	break;
}
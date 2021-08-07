
switch(combatPhase){
	case phase.init:
		for (var i = 0; i < instance_number(battle_spawner); i++){
			var spawner = instance_find(battle_spawner, i);
			var unit = instance_create_depth(spawner.x,spawner.y,0,spawner.unit)
			ds_list_add(global.units,unit);
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
		//this is where you would sort the list of units, based on SPD attribute or whatever else
		
		//if there are as many unitsFinished as units, reset everyone's turnFinished status
		if(unitsFinished >= ds_list_size(global.units)){
			for(var i = 0;i < ds_list_size(global.units);i++){
				with(global.units[|i])
					turnFinished = false;			
			}
			unitsFinished = 0;
		}
		
		//cycle through the units and find the first w/ turnFinished FALSE
		//change unit's local selected status (draws indicator) and make it the selectedUnit
		for (var i = 0; i < ds_list_size(global.units); i++){
			var inst = global.units[|i];
			if (!inst.turnFinished){
				inst.selected = true;
				global.selectedUnit = inst;
				break;
			}
		}  
		allowInput = true;
		combatPhase = phase.wait;
	break;
	
	case phase.wait:
		if (global.selectedUnit.isPlayer)
			allowInput = true;
		else{
			with (global.selectedUnit){
				state = ATTACK; 
				layer_sequence_headpos(unitSequence,atkStart);
				for(var i = 0; i < ds_list_size(global.allies); i++){
					if (global.allies[|i].state != DEATH){
						global.selectedTargets = global.allies[|i];
						break;
						}
				}
			}
		}
		if(selectedFinished == true){
			global.selectedUnit.selected = false;
			unitsFinished++;
			combatPhase = phase.process;
		}
	break;
	
	case phase.process:
		if (processFinished)
			combatPhase = phase.checkFinish;
	break;
	
	case phase.checkFinish:
	if (checkCompletion){
		var checkList = (checkParty ? global.allies : global.enemies);
		var size = ds_list_size(checkList);
		var unbroken = true;
		for (var i=0;i<size;i++){
			var item = ds_list_find_value(checkList,i);
			if !(item.state == DEATH){
				unbroken = false;
				break;
			}
		}
		if (unbroken)
			combatPhase = (checkParty ? phase.lose : phase.win);
	}
	processFinished = false;
		//if(keyboard_check_released(vk_space))
	combatPhase = phase.endTurn;
	
		//if(keyboard_check_released(vk_enter))
			//combatPhase = phase.win;
		//if(keyboard_check_released(vk_control))
			//combatPhase = phase.lose;
	break;
	
	case phase.endTurn:
		checkCompletion = false;
		checkParty = false;
		selectedFinished = false;
		global.selectedTargets = noone;
		combatPhase = phase.startTurn;
	break;
	
	case phase.win:
	//return to previous room
	break;
	
	case phase.lose:
	//game over
	break;
}
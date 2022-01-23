/// @description Continuous (continual) battle management functionality
switch(combatPhase){
	
	case phase.init:
		var characters = [battle_aoi,battle_yusuf]; //declare in inner scope so it's not held?
		var temp = 0;
		for (var i = 0; i<4;i++){//4 global.currentParty slots
			if (global.currentParty[i] != noone) {
				var next_char = characters[global.currentParty[i]];
				//var next_id = instance_create_layer((i%2)==0?16:32,200-(i*64),"Instances",next_char);
				var unit = instance_create_depth((i%2)==0?12:40,140-(i*40),0,next_char);
				ds_list_add(global.units,unit);
				if unit.current[HP]>=1{
					enqueue(unit,getWait(unit));
					ds_list_add(global.allies,unit);
				}
				unit.isPlayer = true;
				temp++;
			}	
		}
		if temp>1{
				global.units[|0].teammate = global.units[|1];
				show_debug_message(string(global.units[|0])+"(#"+string(global.units[|0].index)+")"+"'s teammate is now "+string(global.units[|0].teammate)+"(#"+string(global.units[|0].teammate.index)+")");
				global.units[|1].teammate = global.units[|0];
				show_debug_message(string(global.units[|1])+"(#"+string(global.units[|1].index)+")"+"'s teammate is now "+string(global.units[|1].teammate)+"(#"+string(global.units[|1].teammate.index)+")");
				if temp>3{
					global.units[|2].teammate = global.units[|3];
					global.units[|3].teammate = global.units[|2];
				}
			}
		//cur enemy spawner
		for (var i = 0; i < array_length(global.foesToSpawn); i+=3){
			var unit = instance_create_depth(global.foesToSpawn[i+1],global.foesToSpawn[i+2],0,global.foesToSpawn[i])
			ds_list_add(global.units,unit);
			//ds_priority_add(pq,unit,getWait(unit));
			enqueue(unit,getWait(unit));
			ds_list_add(global.enemies,unit);
		}
		totalUnits = ds_list_size(global.units);
		combatPhase = phase.startTurn;
		instance_create_layer(button_attack.x,button_attack.y-10,"UI_Base",battle_menu);
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
		if (unitsFinished >= totalUnits){
			for(var i = 0;i < totalUnits;i++){
				with(global.units[|i]){
					if !(state == DEATH){
						turnFinished = false;
						turnEnd();
					}
				}
			}
			unitsFinished = 0;
		}
		
		//dequeue the next unit
		//change unit's local selected status (draws indicator) and make it the selectedUnit
		/*var last_key = ds_priority_find_priority(pq,ds_priority_find_min(pq));
		show_debug_message("Gonna delete the "+string(last_key));
		var inst = ds_priority_delete_min(pq); //needs corresponding add?*/
		var last_key = dequeue();//sets global.selectedUnit
		show_debug_message("Bout to reduce "+string(pqSize)+" items by "+string(last_key));
		
		reduce(last_key);
		show_debug_message("Done reduced");
		
		//if (inst.turnFinished||inst.state != DEATH) then it shouldn't be in queue
		if global.selectedUnit>0{
		global.selectedUnit.selected = true;
		//old list-looping method used:	if ((!inst.turnFinished)&&(inst.state != DEATH))
		if (global.selectedUnit.isPlayer){  //do check if dual technique is possible HERE
			show_debug_message("Selected unit "+string(global.selectedUnit)+", is player character "+global.selectedUnit.title+", so I'm showing the buttons");
			solicitInput = false;
			allowInput = true;
			//new method for menu show/hide:
			with battle_menu{
				alarm[0]=1;	
			}
			//old method for menu show/hide:
			//button_attack.visible = 1;
			//button_skill.visible = 1;
			//button_dual_wait.visible = 1;
			//button_item.visible = 1;
			//if (!usingMouse) //button_attack.selected = true;*/
			//show_debug_message("Showing menu buttons");
			//menu = create_button(0,200,280,80,"Attack",simulateInput(global.enemies));
		}
		else {
		    //allowInput = false; //just in case
			solicitInput = true;
		}
		combatPhase = phase.wait;
		}
			
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
			currentMessage = "        You win!";
		}
		else if (selectedFinished){
			//show_debug_message("Selected ("+global.selectedUnit.title+") Finished");
			global.selectedUnit.selected = false;
			global.selectedUnit.turnFinished = true;
			unitsFinished++;
			combatPhase = phase.process;
			//requeue: this calculation should ONLY be used if they did NOT pick WAIT.
			/*var nextPriority;
			if (!global.selectedUnit.isHolding) //this calculation should ONLY be used if they did NOT pick WAIT.
			nextPriority = ds_priority_find_priority(pq,ds_priority_find_max(pq))+getWait(global.selectedUnit); //this process will need to change for overflow reasons
			else nextPriority = ds_priority_find_priority(pq,ds_priority_find_min(pq))+1;//come in at SOONEST opportunity
			show_debug_message("Requeuing "+global.selectedUnit.title+" with priority "+string(nextPriority));
			ds_priority_add(pq,global.selectedUnit,nextPriority);*/
			
			//making units do this to themselves now, bc units know when they're done
			
			//enqueue(global.selectedUnit,getWait(global.selectedUnit));
		}//else show_debug_message("Waiting on "+global.selectedUnit.title); //have selectedFinished signaled by the other thing by an alarm
	break;
	
	case phase.process:
		//show_debug_message("Processing");
		if (processFinished){
			show_debug_message("Process step finished");
			combatPhase = phase.checkFinish;
		}
		
		
	break;
	
	case phase.checkFinish:
		//show_debug_message("Checking for the end of states");
		if (ds_list_empty(global.allies)){
			combatPhase = phase.lose;
			break;
		}
		else if (ds_list_empty(global.enemies)){
			combatPhase = phase.win;
			currentMessage = "        You win!";
			break;
		}
		processFinished = false;
		var tempBool = false;
		for (var i=0; i<array_length(global.targets);i++){
			if global.targets[i] !=noone && global.targets[i].state==HIT tempBool = true; 
		}
		if (!tempBool) combatPhase = phase.endTurn;
		else combatPhase = phase.checkFinish;

	break;
	
	case phase.endTurn:
		selectedFinished = false;
		//global.targets[0].path_speed = 0;
		/*var delayIt = false; //this did not work
		for (var i = 0; i < array_length(global.targets);i++){
			if (global.targets[i].state != IDLE){
				delayIt = true;
				break;
			}
		}
		if !delayIt{*/
		global.targets = [noone];
		combatPhase = phase.startTurn;
		/*}*/
	break;
	
	case phase.win:

		with obj_persistentmusicplayer{
			audio_stop_sound(songPlaying);//stops battle them
			//TO-DO:
			//Start victory theme
			//songPlaying = audio_play_sound(victoryTheme,1000,true);
		}
		//currentMessage = "You win!";
		var ii;
		for (ii = 0; ii<4;ii++){
			if global.currentParty[ii]==noone break;//will cut off last party member if we ever have (member,member,noone,member) so watch out
			global.points[global.currentParty[ii]][HP] = max(0,global.units[|ii].current[HP]);
			global.points[global.currentParty[ii]][MP] = max(0,global.units[|ii].current[MP]);
			global.party[global.currentParty[ii]][XP] += expEarned;
			//CHECKING FOR LEVEL UPS
			if global.party[global.currentParty[ii]][XP] >= lvBreaks[global.party[global.currentParty[ii]][LV]]{
				global.party[global.currentParty[ii]][LV]++;
				upgrade(global.currentParty[ii]);
				ds_list_add(futureMessages,global.names[global.currentParty[ii]]+" is now Level "+string(global.party[global.currentParty[ii]][LV])+"!");
			}
			global.statuses[global.currentParty[ii]]=global.units[|ii].status;
		}
		for (; ii<ds_list_size(global.units);ii++){//checking for drops
			var unit = global.units[|ii];
			if variable_instance_exists(unit,"drops"){
				for (var i = 0;i<array_length(unit.drops);i++){
					var numba = irandom(99);
					if numba <= unit.drops[i][1]{
						if (object_get_parent(unit.drops[i][0])==equippable) or 
						(object_get_parent(object_get_parent(unit.drops[i][0]))==equippable){
							show_debug_message("It's a weapon, "+object_get_name(object_get_parent(unit.drops[i][0])));
							var thing = instance_create_depth(0,0,1,unit.drops[i][0]);
							ds_list_add(global.equipment,thing);
							ds_list_add(futureMessages,"Found "+thing.title+"!");
							
						}
						else{
							var found = -1;
							for (var i = 0;i<ds_list_size(global.inventory);i++){
								//show_debug_message("Checkin "+object_get_name( global.inventory[|i][0] ));
								if global.inventory[|i][0] == unit.drops[i][0]{
								//	show_debug_message("MATCH!");
									found = i;
									break;
								}
							}
							if found>-1{//instance_exists(contents){
								show_debug_message("It's an old item, a(n) "+object_get_name(object_get_parent(unit.drops[i][0])));
								global.inventory[|found][1]++;
							}
							else{
								show_debug_message("It's a new item, a(n) "+object_get_name(object_get_parent(unit.drops[i][0])));
								//var thing = instance_create_depth(0,0,1,contents);
								ds_list_add(global.inventory,[unit.drops[i][0],1]);	
							}
							
							var this = instance_create_depth(0,0,1,unit.drops[i][0]);
							ds_list_add(futureMessages,"Got "+this.title+"!");
							instance_destroy(this);
						}
					}
				}
			}
		}
		global.electrum += cashEarned;
		global.gold += goldEarned;
		if global.fightNo > -1
			global.spawnController.scriptedFights[global.fightNo] = [];
		global.foesToSpawn = [];
		ds_list_destroy(global.units);
		ds_list_destroy(global.allies);
		ds_list_destroy(global.enemies);
		if (global.points[global.currentParty[0]][HP]==0){//reassign leader
			if global.points[global.currentParty[1]][HP]>0{
				var temp = global.currentParty[1];
				global.currentParty[1] = global.currentParty[0];
				global.currentParty[0] = temp;
			}
			else{//swap teams
				var temp = global.currentParty[0];
				global.currentParty[2] = global.currentParty[0];
				global.currentParty[2] = temp;
				temp = global.currentParty[1];
				global.currentParty[1] = global.currentParty[3];
				global.currentParty[3] = temp;
			}
		}
		resultsRemaining++;
		currentMessage=(cashEarned>0?("  Got "+string(cashEarned)+" Electrum!  "):"")+(goldEarned>0?("  Got "+string(goldEarned)+" Electrum!\n"):"\n")+"  Got "+string(expEarned)+"XP!";
		combatPhase=phase.postWin;//will return here
		break;
	case phase.escape:
	    for (var i = 0; i<ds_list_size(global.allies);i++){
		   layer_sequence_xscale(global.allies[|i].unitSequence,-1);
		}
        if(animCounter--)>0{
            for (var i = 0; i<ds_list_size(global.allies);i++){
                layer_sequence_x(global.allies[|i].unitSequence, layer_sequence_get_x(global.allies[|i].unitSequence)-2);
            }
        }
		else{
		currentMessage = "You escaped!";
		show_debug_message("You got out of there!");
		if global.fightNo > -1{
			global.spawnController.scriptedFights[global.fightNo]=[];//global.foesToSpawn;
			for (var i = 0; i < ds_list_size(global.enemies);i++){
				global.spawnController.scriptedFights[global.fightNo][i*3]=global.enemies[|i].object_index;
				global.spawnController.scriptedFights[global.fightNo][(i*3)+1]=global.enemies[|i].x;
				global.spawnController.scriptedFights[global.fightNo][(i*3)+2]=global.enemies[|i].y;
			}
		}
		for (var i = 0; i<4;i++){
			if global.currentParty[i]==noone continue;
			global.points[global.currentParty[i]][HP] = max(0,global.units[|i].current[HP]);
			global.points[global.currentParty[i]][MP] = max(0,global.units[|i].current[MP]);
			global.party[global.currentParty[i]][XP] += expEarned;//sure since expEarned is only the killed ones
			//CHECKING FOR LEVEL UPS
			if global.party[global.currentParty[i]][XP] >= lvBreaks[global.party[global.currentParty[i]][LV]]{
				global.party[global.currentParty[i]][LV]++;
				upgrade(global.currentParty[i]);
				ds_list_add(futureMessages,global.names[global.currentParty[i]]+" is now Level "+string(global.party[global.currentParty[i]][LV])+"!");
			}
			global.statuses[global.currentParty[i]]=global.units[|i].status;
		}
		if (global.points[global.currentParty[0]][HP]==0){//reassign leader
			if global.points[global.currentParty[1]][HP]>0{
				var temp = global.currentParty[1];
				global.currentParty[1] = global.currentParty[0];
				global.currentParty[0] = temp;
			}
			else{//swap teams
				var temp = global.currentParty[0];
				global.currentParty[2] = global.currentParty[0];
				global.currentParty[2] = temp;
				temp = global.currentParty[1];
				global.currentParty[1] = global.currentParty[3];
				global.currentParty[3] = temp;
			}
		}
		
		global.foesToSpawn = [];
		ds_list_destroy(global.units);
		ds_list_destroy(global.allies);
		ds_list_destroy(global.enemies);
		//TO DO:  Add check for level up.  Send to POSTWIN instead if that's the case otherwise.
		if ds_list_size(futureMessages)==0 room_goto(global.returnRoom);
		else combatPhase=phase.postWin;
		}
	break;
	case phase.lose:
		show_debug_message("You lose...");
		global.foesToSpawn = [];
		room_goto(gameover);
	//game over
	break;
	case phase.postWin://displaying results
		var goButton = ((mouse_check_button_pressed(mb_left)) || (mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_enter));
		if goButton{
			if ds_list_size(futureMessages)>0{
				currentMessage = futureMessages[|0];
				ds_list_delete(futureMessages,0);
			}else room_goto(global.returnRoom);
		}
		//if resultsRemaining==0 
		//orig Room1

	
}
/// @description Used for compound events
// You can write your code in this editor
x = global.allies[|index].x;
y = global.allies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		with (global.selectedUnit){
			state = ITEM;
			layer_sequence_headpos(unitSequence,itmStart);
		}
		//for consistency, should probably move the below to helper.useItem()?
		with (global.itemInUse[0]){
				event_user(0); 
			}
		show_debug_message("User event exited.");
		//trying to keep going instead of crash here
		global.selectedUnit.selected = false;
		global.selectedUnit.turnFinished = true;
		show_debug_message("Setting battle manager settings and destroying selector.");
		with (battle_manager){
			//selectedFinished = true; //set by battle_manager->Broadcast
			unitsFinished++;
			combatPhase = phase.process;
			//requeue
			var nextPriority = ds_priority_find_priority(pq,ds_priority_find_max(pq))+getWait(global.selectedUnit); //this process will need to change for overflow reasons
			show_debug_message("Requeuing "+global.selectedUnit.title+" with priority "+string(nextPriority));
			ds_priority_add(pq,global.selectedUnit,nextPriority);
		}
		//global.inventory[|global.itemInUse[1]][1] -= 1;
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
		button_item.visible = 1;
        button_item.selected = true;
		instance_destroy();
	}	
	





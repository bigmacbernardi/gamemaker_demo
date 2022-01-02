/// @description Used for compound events
// You can write your code in this editor
var sets = [global.allies,global.enemies];
x = sets[mode][|index].x;
y = sets[mode][|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		var unit = global.selectedUnit;
		with (unit){
			state = ITEM;
			layer_sequence_headpos(unitSequence,itmStart);
		}
		//for consistency, should probably move the below to helper.useItem()?
		with (global.itemInUse[0]){
				event_user(0); 
			}
		show_debug_message("User event exited.");
		//trying to keep going instead of crash here
		unit.selected = false;
		unit.turnFinished = true;
		show_debug_message("Setting battle manager settings and destroying selector.");
		with (battle_manager){
			//selectedFinished = true; //set by battle_manager->Broadcast
			unitsFinished++;
			combatPhase = phase.process;
			//requeue
			/*var nextPriority = ds_priority_find_priority(pq,ds_priority_find_max(pq))+getWait(global.selectedUnit); //this process will need to change for overflow reasons
			show_debug_message("Requeuing "+global.selectedUnit.title+" with priority "+string(nextPriority));
			ds_priority_add(pq,global.selectedUnit,nextPriority);*/
			enqueue(unit);
		}
		//global.inventory[|global.itemInUse[1]][1] -= 1;
        instance_destroy();
	}
else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace))
	{
		battle_manager.allowInput = true;
		button_attack.visible = 1;
		button_skill.visible = 1;
		button_dual_wait.visible = 1;
		button_item.visible = 1;
        button_item.selected = true;
		instance_destroy();
	}	
else{
	var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
	var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
	var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
	var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
	if (_up){
		if (index == 0) index = ds_list_size(sets[mode])-1;
		else index--;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}
	if (_down){
		if (index == ds_list_size(sets[mode])-1) index = 0;
		else index += 1;
		global.targets = [sets[mode][|index]];
		currentMessage = global.targets[0].title;
	}
	if (_right){
		if (mode==0){//EVENTUALLY this should be based on leftWest and rightEast.
			mode = 1;
			if (index > ds_list_size(global.enemies)-1) index = ds_list_size(global.enemies)-1;
			global.targets = [sets[mode][|index]];
		}
		currentMessage = global.targets[0].title;
	}
	if (_left){
		if (mode==1){//EVENTUALLY this should be based on leftWest and rightEast.
			mode = 0;
			if (index > ds_list_size(global.allies)-1) index = ds_list_size(global.allies)-1;
			global.targets = [sets[mode][|index]];
		}
		currentMessage = global.targets[0].title;
	}
}	





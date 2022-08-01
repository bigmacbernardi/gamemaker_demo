/// @description Insert description here
if keyboard_check_pressed(vk_tab) descriptionsOn = !descriptionsOn;
if global.selectedUnit<0 or !global.selectedUnit.isPlayer{
	menuDisplaying=false;
	submenuDisplaying=false;
	menuActive=false;
}
if selected menuActive = true;
if menuDisplaying and menuActive and battle_manager.allowInput{
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
	var cancel = ((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape));
	//cancel should be handled by whatever's created by actions[index]
	//var _moveV = _down - _up;
	var rows = 4+bigSubmenu;
	if _down{
		if index==(array_length(actions)-1) or (index%rows==rows-1)//last option OR bottom of column
			index-=	(array_length(actions)-1)%rows;//bring to top of column
		//else if index==(rows*2)-1 index = rows
		else index++;
	}
	else if _up{
		//if index==rows index=(min((rows*2)-1,array_length(actions)-1)) else 
		if index%rows==0 index=min(index+rows-1,array_length(actions)-1);
		else index--;
	}
	if _right{
		if actions[index].lvl>1 && secondIndex-1< actions[index].lvl//if can move spell level
			secondIndex++;
		else if index < array_length(actions)-rows{
			index+=rows;
			secondIndex=0;
		}
		else if index<rows index=array_length(actions)-1;//if empty space in grid bring to last option?  should probably wrap instead?
		else if index%rows==0{//top-right
			index=0
			secondIndex=0;
		}
		//else index=1;//???
	}
	else if _left{
		if actions[index].lvl>0 && secondIndex>0
			secondIndex--;
		else if index>rows-1 {
			index-=rows;
			if actions[index].lvl>0 secondIndex=actions[index].lvl-1;
			else secondIndex=0;
		}
		else{//wrap to rightmost valid column in same row
			var ni = array_length(actions)-(array_length(actions)%rows)+(index%rows)
			if array_length(actions)<= ni 
				ni-=rows;
			index = ni;
		}	
		//else index = 0;//? on the fence about this
	}
	
	if go
		and global.selectedUnit==unit{//preemptive failsafe
		selected=false;  
		battle_manager.currentMessage = "";
		var action = actions[index];
		show_debug_message("MENU GOING: "+string(index)+"="+action.name);
		var keys = variable_struct_get_names(action);
		for (var i = array_length(keys)-1; i >= 0; --i) {
			show_debug_message(keys[i]+" : "+string(action[$ keys[i]]));
		}
		if action.action==castStandard{
			//var cost = action.mp[secondIndex];
			/*with unit{//MOVE THIS TO STANDARD CAST
				current[MP] = max(0, current[MP]-cost);
			}*/
			switch(action.element){
				case 8:
				case 14:
				case 15:
				case 16:
					global.selectMode = 1;
				default:
					global.selectMode = 0;
			}
			var inst = instance_create_depth(0,0,0,spell_selector);
			inst.element = action.element;
			inst.strength = secondIndex+1;//haven't decided whether to calculate actual power here or later
			inst.cost = action.mp[secondIndex];
		
			global.targets=[global.enemies[|0]];
			
			//standardCast(actions[index].element,secondIndex+1,unit,global.targets);	
			menuActive=false;
		}
		else if array_length(action.children)>0{
			submenuDisplaying=true;
			parent = {
				//indexEntered:index,//too hard for now
				actions:actions,
				parent: parent
			};
			openSubmenu(action.children);
			bigSubmenu = array_length(actions)>8;
		}
		else{
			menuActive=false;
			actions[index].action();//script_execute(actions[index]);
		}
		
	}
	if cancel /*and submenuDisplaying*//*ain't right*/ and parent>0{
		actions = parent.actions;
		parent = parent.parent;
		openSubmenu(actions);//to update other, dummying out lists
		submenuDisplaying = (parent != noone);
	}
}
if array_length(actions)>0 and !(instance_exists(obj_speechmenu)or instance_exists(obj_itemmenu)or instance_exists(obj_dualmenu)){
	var action = actions[index];
	if descriptionsOn and variable_struct_exists(action,"description"){
		if is_array(action.description)	battle_manager.currentMessage = action.description[secondIndex];
		else battle_manager.currentMessage = action.description;
	}
	else battle_manager.currentMessage = "";
}
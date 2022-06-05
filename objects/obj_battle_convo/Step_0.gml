/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if allowedToGo{
	var line = lines[|index];
	if line == undefined instance_destroy()
	else if string_char_at(line,0)=="{"{
		var ll = string_lower(line);
		var secondArg = string_pos_ext(" ", line, string_pos(" ",line)+1)+1;//position of second arg
		//do action
		if string_pos("give",ll)==1{
			
		}
		else if string_pos("stat",ll)==1{
			
		}
		else if string_pos("hit",ll)==1{
			//read attacker
			if string_pos("selected",ll) == 5{//global.selectedUnit
				if string_pos("target",ll) == secondArg{
					 unitAttack(global.selectedUnit,global.targets,false);
				}
			}
			else if string_pos("target",ll) == 5{//global.selectedUnit
				if string_pos("selected",ll) == secondArg{
					 unitAttack(global.targets[0],[global.selectedUnit],false);
				}
			}
		}
		else if string_pos("cast",ll)==1{
			
		}
		else if string_pos("event",ll)==1{
			
		}
		else if string_pos("move",ll)==1{
			
		}
		else if string_pos("warp",ll)==1{
			
		}
		else if string_pos("end",ll)==1{
			with battle_manager{
				enqueue_unit(global.selectedUnit());	
			}
			instance_destroy();//?
		}
		
		
	}
	else if (!frameHasPassed){
		battle_manager.currentMessage = line;
		frameHasPassed=true;
		//show_debug_message("Starting convo");
		if string_char_at(line,0)=="*"
			with battle_manager currentMessage = line;
		//else instance_destroy();
	}
	else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{	
		//show_debug_message("Advancing convo.  Index was "+string(index));
		var pos = string_pos("=>",line); //to determine next index mutation
		if pos > 0//{
			//show_debug_message("Line will no longer be: "+line+"; pos is: "+string(pos));
			index = round(real(string_copy(line,pos+2,string_length(line)-(pos+1))))
		//}
		else index += (mychoice + 1);
		/* INDEX HAS CHANGED */
		mychoice=0;
		if index>=ds_list_size(lines){
			with battle_manager currentMessage = "";	
			instance_destroy();
		}
		//else {//let's keep going
		show_debug_message("Index is now "+string(index));
		line = lines[|index];
			
		//}
		
		if line==undefined{
			with battle_manager currentMessage = "";	
			instance_destroy();
		}else if string_char_at(line,0)=="*"{
			show_debug_message("Now choosin");
			choosing=true;
			choices=[];
			choiceTotal=0;
			var lastChoice=3;
			for (var i = 2; i<string_length(line);i++){
				if (string_char_at(line,i)=="*"){
					choices[choiceTotal++]=string_copy(line,lastChoice,i-lastChoice-1);
					lastChoice=i+2;
				}
			}
			choices[choiceTotal++]=string_copy(line,lastChoice,string_length(line)-lastChoice);//last option
					
			mychoice=0;
		}
		else{
			pos = string_pos("=>",line) - 1;//to detect need to crop output
			battle_manager.currentMessage = (
				pos < 0 ? line		:
						string_copy(line,0,pos));
		
			choosing=false;
			mychoice=0;
			choiceTotal = 0;
			choices=[];
		}
	}
	else if((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_backspace))
		{
			battle_manager.allowInput = true;
			with battle_menu{
				alarm[0]=1;//show the menu and reenable input	
			}
			priorMenu.selected = true;
	        instance_destroy();
		}
	else if choosing{
		var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
		var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
		var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
		var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
		var _moveH = _right - _left;
		var _moveV = _down - _up;
		mychoice = max(0,min(mychoice + _moveH + _moveV,choiceTotal-1));
	}
}





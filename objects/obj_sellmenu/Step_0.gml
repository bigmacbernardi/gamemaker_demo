/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if (selected){
	
if (!frameHasPassed) frameHasPassed = true;
else if(mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{
		if (index3==3){
			//resorting.  no behavior for this yet
			audio_play_sound(ElecMeany2Hit,100,false);
		}
		else if (mode==0){
			if (options[|index][0].usable){
		    global.itemToSell = options[|index][2];
			mode = 1;
			index2=0;
			global.targets = [global.currentParty[index2]];
			}
			else audio_play_sound(Notice3,50,false);
		}else if (mode==1){//select num to sell
			numToSell = 1;
		}else if (mode==1){
			/*with (global.itemInUse[0]){
				event_user(0); 
			}*/
			global.electrum+=options[|index][0].value;
			if options[|index][1]{//is item
					var inv = options[|index][2];
					options[|index][0].numOwned--;
					if --global.inventory[inv][1] < 1{
						ds_list_delete(global.inventory, inv);
						ds_list_delete(options, index);
					}
			}
			else{//is equipment
				ds_list_delete(global.equipment, options[|index][2]);
				ds_list_delete(options, index);
			}
			/*attempt to update lmao*/
			var drawX = 0;
			var drawY = y;
			options = ds_list_create(); 
			for (var i = 0; i < ds_list_size(global.inventory); i++){
			  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
			  if ((i % 3)==2){
				drawX = 0;
				drawY += 24;
			  }else	drawX += 100;
  
			}
			/*budump*/
			index2 = -1;
			mode = 0;
		}
	}
else if((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape))
	{
		priorMenu.selected = true;
        instance_destroy();
	}
else {
	var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _moveH = _right - _left; //will use this for pagination/filters/selecting sort options
	var _moveV = _down - _up;
	if (_moveH!= 0){ //will wrap eventually
			var types=[0,edible,battle_item,key_item,0];
			index3+=_moveH;
			if (index3>=array_length(filterOptions)) index3=0;
			//update options here
	//}else if (_moveH< 0){ //will wrap eventually
			//index3--;
			else if (index3<0)index3=array_length(filterOptions)-1;
			//update options here
			filt(types[index3]);
		
	}
	if (_moveV != 0){
		if (mode==0){
			index += _moveV;
			if (index < 0) index = ds_list_size(options)-1;
			else if (index > ds_list_size(options)-1) index = 0;
		}
		else if (mode == 1){
			index2+= _moveV;
			if (index2 < 0){
				index2 = 3;
				while global.currentParty[index2] == noone{
					index2--;	
				}
			}
			else if (index2 > 3)||(global.currentParty[index2] == noone)
				index2 = 0;
				
			global.targets = [global.currentParty[index2]];
		}
	}
}

}
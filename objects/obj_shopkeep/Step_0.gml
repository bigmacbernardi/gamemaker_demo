/// @description Mainly menu navigation logic
event_inherited();
var runnin = activated && !instance_exists(obj_sellmenu) && !instance_exists(obj_sellmenu) && !chatting;
// Inherit the parent event
if (runnin)
{
	var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
	var backButton = ((mouse_check_button_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace));
	var _moveV =  keyboard_check_released(vk_down) - keyboard_check_released(vk_up);
	//var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
	if (_moveV < 0){
		if selected == 1 or selected == 2 selected--;
		else if selected == 0 selected = 3;
		else if selected == 3 selected = 1 + chattable;
	}
	else if (_moveV > 0){
		if selected == 0 or selected == 2 selected++;
		else if selected == 3 selected = 0;
		else if selected == 1 selected = 3 - chattable;
	}
	if (goButton){
		switch(selected){
			case 0:	//spawnn buymenu (haggleable? buymenu:buymenuflex)
					break;
			case 1:	instance_create_depth(0,0,-100,obj_sellmenu);//spawn hagglable?sellmenu:sellmenuflex
					break;
			case 2:	global.lineNo = 200; 
					global.typer= 5;
					global.facechoice= 0;
					global.faceemotion= 0;
					if (instance_exists(obj_dialoguer)) instance_destroy(obj_dialoguer);
					message = instance_create_layer(camera_get_view_x(cam),10,"Instances",obj_dialoguer);
					break;
			case 3:	//exit this crap
			activated = false;
			obj_player.paused = false;
					break;
		}
	}else if (backButton){ //exit this crap
		activated = false;
		obj_player.paused = false;
	}
}
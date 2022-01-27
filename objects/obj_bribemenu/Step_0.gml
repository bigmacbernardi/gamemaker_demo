/// @description Used for compound events
// You can write your code in this editor
//x = 0;//global.enemies[|index].x;
//y = global.enemies[|index].y;
if (!frameHasPassed) frameHasPassed = true;
else if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
{
	battle_manager.currentMessage = "";
		//replace this part with selection thing
	show_debug_message("Bribe click detected");
	bribe_attempt(electrumAmount,goldAmount,global.targets[0]);
	global.electrum-=electrumAmount;
	global.gold-=goldAmount;
	with battle_manager alarm[1]=1;
	instance_destroy();//has to come last ofc
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
else {
	var _up = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));
	var _down = keyboard_check_released(vk_down) or keyboard_check_released(ord("S"));
	var _left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
	var _right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
	var _moveH = _right - _left;
	if (_down - _up != 0){
		changingGold = !changingGold;
		show_debug_message("Switched"+(changingGold?" from ":" to ")+string(electrumAmount)+" E"+(changingGold?" to ":" from ")+string(goldAmount)+" G");
	
	}
	if changingGold
		goldAmount+=_moveH * (keyboard_check_pressed(vk_shift)*10);	
	else electrumAmount+=_moveH * (keyboard_check_pressed(vk_shift)*10);
	goldAmount = min(goldAmount,global.gold);
	electrumAmount = min(electrumAmount,global.electrum);
}
	





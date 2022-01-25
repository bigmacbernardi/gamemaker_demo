/// @description Insert description here
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check_released(vk_up) - keyboard_check_released(vk_down);
var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
level = level + _moveV + _moveH;
if goButton{
	if currentLevel<level{
		repeat(level-currentLevel){
			for (var i=0;i<4;i++){
				if global.currentParty[i]==noone continue;
				global.party[global.currentParty[i]][LV]++;
				upgrade(global.currentParty[i]);
			}
		}
	}
	else repeat(currentLevel-level){
		for (var i=0;i<4;i++){
			if global.currentParty[i]!=noone downgrade(global.currentParty[i]);
		}
	}

	obj_player.paused=false;
	instance_destroy();
}
else if backButton{
	obj_player.paused=false;
	instance_destroy();	
}
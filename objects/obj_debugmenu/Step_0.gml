/// @description Insert description here
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check_released(vk_up) - keyboard_check_released(vk_down);
var _moveH =  keyboard_check_released(vk_right) - keyboard_check_released(vk_left);
currentIndex = max(0,min(array_length(options)-1,currentIndex - _moveV));
if options[currentIndex]=="NO-CLIP"{
	if goButton or _moveH noClipOn = !noClipOn;
}
else if goButton and !usingSubmenu{
	switch(options[currentIndex]){
		case "LEVEL":
			instance_create_depth(x,y,depth-1,obj_lvdebug);
			usingSubmenu = true;
			break;
		case "WARP": 
			instance_create_depth(x,y,depth-1,obj_roomdebug);
			usingSubmenu = true;
			break;
		case "PARTY": 
			instance_create_depth(x,y,depth-1,obj_roomdebug);
			usingSubmenu = true;
			break;
		case "INVEM": 
			instance_create_depth(x,y,depth-1,obj_item_fenagler);
			usingSubmenu = true;
			break;
		case "EVENT": 
			instance_create_depth(x,y,depth-1,obj_roomdebug);
			usingSubmenu = true;
			break;
		case "MUSIC": 
			instance_create_depth(x,y,depth-1,obj_jukemenu);
			usingSubmenu = true;
			break;
		case "RESET SPAWNS": 
			break;
		case "EXIT":
			obj_player.paused=false;
			instance_destroy();
	}
}
else if backButton{
	if usingSubmenu{
		usingSubmenu = false;
	}else{
		obj_player.paused=false;
		instance_destroy();	
	}
}
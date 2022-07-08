/// @description Change this to paginate instead of scroll!
var goButton = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
var backButton = ((mouse_check_button_pressed(mb_right)) || keyboard_check_pressed(vk_shift)|| keyboard_check_pressed(vk_backspace));
var _moveV =  keyboard_check/*_released*/(vk_up) - keyboard_check/*_released*/(vk_down);
var _moveH =  keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if _moveV ==1 and currentIndex==scrollLevel and easeFrames<=0{
	scrollLevel = max(0,scrollLevel-1);
	easeFrames = 2;
	currentIndex = max(0,currentIndex - 1)
}
else if _moveV==-1 and currentIndex==scrollLevel+9  and easeFrames<=0{
	scrollLevel = min(array_length(names)-10,scrollLevel+1);
	easeFrames = 2;
	currentIndex = min(array_length(names)-1,currentIndex + 1);
}else{
	if (easeFrames-- <= 0) currentIndex = max(0,min(array_length(names)-1,currentIndex - _moveV));
}
if _moveH > 0 and (currentIndex+10)<array_length(names){
	currentIndex += 10;
	scrollLevel += 10;
}
else if _moveH < 0 and currentIndex>10/* and scrollLevel>10 */{
	currentIndex -= 10;
	scrollLevel -= 10;
}
/*else*/ 
if goButton{
	var songPicked = songs[currentIndex];
	with obj_persistentmusicplayer{
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(songPicked,1,true);
		if obj_jukemenu.currentIndex < obj_jukemenu.actualMax{
			trackNo = obj_jukemenu.currentIndex;
			playing = true;
		}
		else{
			trackNo = obj_jukemenu.actualMax;//was set to -1
			playing = false;
		}
	}
}
else if backButton{
	instance_destroy();
}
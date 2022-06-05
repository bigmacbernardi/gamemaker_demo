/// @description Best place to put step logic?
draw_self();
if (x_spd != 0 or y_spd != 0) and
  (image_index == 0 or image_index == (keyboard_check(vk_shift)?13:8)){
	if not stepping{
		stepping = true;
		stepsTaken+=1+keyboard_check(vk_shift);
	}
} else stepping = false;
/// @description Insert description here
// You can write your code in this editor
if defaulted {
	var enter_key = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	var left_key = keyboard_check_pressed(vk_left)|| keyboard_check_pressed(ord("A"));
	var right_key = keyboard_check_pressed(vk_right)|| keyboard_check_pressed(ord("D"));
	var up_key = keyboard_check_pressed(vk_up)|| keyboard_check_pressed(ord("W"));
	var down_key = keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));
	var back_key = ((keyboard_check_released(mb_right)) || keyboard_check_released(vk_shift)|| keyboard_check_released(vk_backspace));
	if enter_key{
		if index2== array_length(characters)//on "Submit"
			saveName();
		else{
			if string_length(name_so_far) == char_limit
			 name_so_far = string_copy(name_so_far, 1,char_limit-1) + characters[index2]
			else name_so_far = name_so_far + characters[index2];
			index++;
		}
	}
	else if back_key{
		if string_length(name_so_far)>0{
			name_so_far = string_copy(name_so_far, 1,string_length(name_so_far)-1);
			if index>0 index--;
		}
		else audio_play_sound(Owl2,5,false);
	}
	else{
		if left_key{
			if index2==array_length(characters) index2=9;
			else if (--index2<0)index2=array_length(characters)-1;
			
		}
		if up_key{
			if (index2<10)index2=index2%10;
			else index2-=10;
		}
		if right_key{
			if index2==9 index2=array_length(characters);
			else if (++index2>=array_length(characters))index2=0;
		}
		if down_key{
			if (index2+10<array_length(characters))index2+=10;
		}
	}
}	
else if naming_whom>=0{
	name_so_far = global.names[naming_whom];
	index = string_length(name_so_far)-1;
	defaulted = true;	
}

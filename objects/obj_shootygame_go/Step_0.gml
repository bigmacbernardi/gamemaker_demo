/// @description SHUUT
var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
if go{
		if !instance_exists(obj_dart)/*shot is NOT on screen*/{
			if --shots>0{
				audio_play_sound(shotgun,100,false);
				instance_create_depth(obj_shooter.x,obj_shooter.y,-obj_shooter.y,obj_dart);
				//fire shot
				//binibini
			}
			else {
				instance_destroy();
			}
		}
		
		
}
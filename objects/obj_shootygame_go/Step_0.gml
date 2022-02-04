/// @description SHUUT
var go = ((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter));
if go{
		if true/*shot is NOT on screen*/{
			if --shots>0{
				instance_create_depth(obj_shooter.x,obj_shooter.y,-obj_shooter.y,obj_dart);
				//fire shot
				//binibini
			}
			else {
				instance_destroy();
			}
		}
		
		
}
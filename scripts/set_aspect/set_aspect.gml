// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_aspect(argument0) {
	with(obj_camera)
	{
		switch(argument0)
		{
			case Aspects._16x9: 
				current_height = base_height;
				current_width = base_height*(16/9);
				break;
			case Aspects._21x9: 
				current_height = base_height;
				current_width = base_height*(21/9);
				break;
			case Aspects._4x3: 
				current_height = base_height;
				current_width = base_height*(4/3);
				break;
			case Aspects._1x1: 
				current_height = base_height;
				current_width = base_height;
				break;
			case Aspects._9x16: 
				current_width = base_height;
				current_height = base_width;
				break;
		}
	
		//instance_create_depth(0,0,-1000,obj_screen_fade);
		resize_window;
		event_user(0); //snap camera
	}


}
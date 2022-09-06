switch (state){
	case 0:
			if (++progress >= room_speed) state = 1;
			break;
	case 1: show_debug_message("Scene 0 Phase 1");
                    say(11,YUSUF+2);
			state = 2;
			break;
	case 2: if !instance_exists(obj_writer){
                   say(12); 
			state = 3;
}
			break;
	case 3:
			show_debug_message("Scene 0 Phase 3");
			var namer = instance_create_layer(0,0,"Instances",obj_nameentry);
			namer.naming_whom = YUSUF;
			state = 4;
			break;
	case 4: show_debug_message("0-4");
			if !instance_exists(obj_nameentry)state = 5;
			with obj_player{
				facing = 2;	
			}
			break;
	case 5: if !instance_exists(obj_writer){
                   say(13,YUSUF); 
			state = 6;
			}
			break;
	case 6: if !instance_exists(obj_writer){
                    say(14); 
					state = 7;
			}
			break;

	case 7: if !instance_exists(obj_writer){
	                   say(15,YUSUF); 
				state = 8;
			}
			break;
	default:
		camera_set_view_target(cam,obj_player);
		obj_player.paused = false;
		global.currentParty = resetParty; //crude
		instance_destroy();
}
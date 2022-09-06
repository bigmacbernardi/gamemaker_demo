switch (state){
	case 0:
			obj_player.paused = true;
			if (++progress >= room_speed) state = 1;
			break;
	case 1: show_debug_message("Scene 0 Phase 1");
            say(11,YUSUF);
			state = 2;
			break;
	case 2: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
				show_debug_message("Scene 0 Phase 2");
				var namer = instance_create_layer(0,0,"Instances",obj_nameentry);
				namer.naming_whom = YUSUF;
				state = 3;
			}
			break;
	case 3: show_debug_message("0-3");
			if !instance_exists(obj_nameentry)state = 5;
			else obj_player.paused = true;
			with obj_player{
				facing = 4;	
			}
			break;
	case 4: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
                say(12); 
				state = 5;
			}
			break;
	case 5: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
                   say(13,YUSUF); 
			state = 6;
			}
			break;
	case 6: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
                    say(14); 
					state = 7;
			}
			break;

	case 7: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
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
switch (state){
	case 0:
			obj_player.paused = true;
			if (++progress >= 10*room_speed) state = 0.5;
			break;
      case 0.5:
          with obj_player{
                  facing = 4;
                  x_spd = -1;
           }
           if --progress<40 state = 1;
	case 1: 
       with obj_player{
                  facing = 2;
                  x_spd = 0;
           }
show_debug_message("Scene 0 Phase 1");
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
	case 3: //show_debug_message("0-3");
			if !instance_exists(obj_nameentry)state = 4;
			else obj_player.paused = true;
			with obj_player{
				facing = 4;	
			}
			break;
	case 4: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 4");
				obj_player.paused = true;
                say(12,20); //mom says line 12
				state = 5;
			}
			break;
	case 5: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 5");
				obj_player.paused = true;
				show_debug_message(state);
                say(13,YUSUF); 
				state = 6;
				show_debug_message(state);
			}
			break;
	case 6: show_debug_message("Scene 0 Phase 6");
			if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
                say(14,20); 
				state = 7;
			}
			break;

	case 7: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 7");
				obj_player.paused = true;
	            say(15,YUSUF); 
				state = 8;
			}
			break;

	case 8: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 8");
				obj_player.paused = true;
	            say(16); 
				state = 9;
			}
			break;

	case 9: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 9");
				obj_player.paused = true;
	            say(17,20);   //mom says line 17
				state = 10;
			}
			break;

	case 10: if !instance_exists(obj_dialoguer){
				show_debug_message("Scene 0 Phase 10");
				obj_player.paused = true;
	                   say(18,YUSUF); 
				state = 11;
			}
			break;
	case 11: if !instance_exists(obj_dialoguer){
				obj_player.paused = true;
	            say(19,20);  //mom says line 19
				state = 12;
			}
			break;
	default:
		camera_set_view_target(cam,obj_player);
		obj_player.paused = false;
		global.currentParty = resetParty; //crude
		show_debug_message("desutrpyah");
		instance_destroy();
}
/// @description Even check for input here
switch (state){
	case 0:
			if (++progress >= room_speed) state = 1;
			break;
	case 1: show_debug_message("Scene 2 Phase 1");
			state = 2;
			break;
	case 2: show_debug_message("Scene 2 Phase 2");
			state = 3;
			break;
	case 3:
			show_debug_message("Scene 2 Phase 3");
			state = 4;
			break;
	case 4: show_debug_message("Scene 2 Phase 4");
			with obj_player{
				facing = 2;	
			}
			state = 5;
			break;
	case 5: show_debug_message("Scene 2 Phase 5");
			state = 6;
			obj_player.paused = false;
			break;
	default:
		camera_set_view_target(cam,obj_player);
		obj_player.paused = false;
		global.currentParty = resetParty; //crude
		instance_destroy();
}
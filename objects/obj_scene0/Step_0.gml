/// @description Even check for input here
switch (state){
	case 0:
			if (++progress >= room_speed) state = 1;
			break;
	case 1:
			break;
	case 2:
			break;
	case 3:
			
			break;
	case 4:
			break;
	case 5:
			break;
	default:
		camera_set_view_target(cam,obj_player);
		obj_player.paused = false;
		global.currentParty = resetParty; //crude
		instance_destroy();
}
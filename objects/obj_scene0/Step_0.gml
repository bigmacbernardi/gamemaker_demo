/// @description Even check for input here
switch (state){
	case 0:
			if (++progress >= room_speed) state = 1;
			break;
	case 1: state = 2;
			break;
	case 2: state = 3;
			break;
	case 3:
			var namer = instance_create_layer(0,0,"Instances",obj_nameentry);
			namer.naming_whom = YUSUF;
			state = 4;
			break;
	case 4: if !instance_exists(obj_nameentry)state = 5;
			with obj_player{
				facing = 2;	
			}
			break;
	case 5: state = 6;
			break;
	default:
		camera_set_view_target(cam,obj_player);
		obj_player.paused = false;
		global.currentParty = resetParty; //crude
		instance_destroy();
}
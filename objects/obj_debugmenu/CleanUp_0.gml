/// @description Unpause boy
with obj_lvdebug{
	instance_destroy();	
}
with obj_roomdebug{
	instance_destroy();	
}
obj_player.paused=false;
/// @description Moved from obj_warp
if !instance_exists(obj_dialoguer) and !instance_exists(battle_manager) 
	obj_player.paused = false;
stepsTaken = 0;
global.location_name = getRoomName();
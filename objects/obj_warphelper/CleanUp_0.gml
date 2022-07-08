/// @description Unpause
obj_player.paused=false;
show_debug_message("Player coords: ("+string(obj_player.x)+","+string(obj_player.y)+")");
obj_warptarget.instance_destroy();
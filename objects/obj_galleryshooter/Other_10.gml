/// @description Freezes player and starts a shooty game!

obj_player.paused = true;
instance_create_layer(10,10,"Instances",obj_shootygame_go);

//room_goto(Minigame0);
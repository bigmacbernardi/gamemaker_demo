/// @description Used to freeze player. Starts a shooty game!
obj_player.paused=false;//to cancel out normal "checkable" interaction
if !instance_exists(obj_shootygame_go)
instance_create_layer(x,y,"Instances",obj_shootygame_go);

//room_goto(Minigame0);
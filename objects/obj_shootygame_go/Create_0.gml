/// @description used to lock the player in place. let's get SHOOTin
//obj_player.paused = true;//no longer doing this.  still happens somehow?
shots=10;
points = 0;
instance_create_depth(x,y- 50,50-y,obj_shootytarget);
instance_create_depth(obj_player.x,obj_player.y-5,5-obj_player.y,obj_shooter);
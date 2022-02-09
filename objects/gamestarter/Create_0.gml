/// @description A funny little way to keep up this whole obj_initializer business while using a save system.
instance_create_depth(0,0,0,obj_initializer);//sets everything to its initial state
room_goto(Room2);//has to be the first
instance_destroy();
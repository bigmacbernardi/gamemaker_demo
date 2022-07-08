/// @description Insert description here

if room != old_room and !placed{
	if instance_exists(obj_warptarget){
		obj_player.x=obj_warptarget.x;
		obj_player.y=obj_warptarget.y;
		placed=true;
		
	}
	else{
	  //obj_player.paused=true;//might as well!
	  //placed = checkForOpenSpace(room_width/2,room_height/2,room_width/4,room_height/4);
	}
}
else if placed instance_destroy();
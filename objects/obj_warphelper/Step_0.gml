/// @description Insert description here

if room != old_room{
  obj_player.paused=true;//might as well!
  placed = checkForOpenSpace(room_width/2,room_height/2,room_width/4,room_height/4);
}
if placed instance_destroy();
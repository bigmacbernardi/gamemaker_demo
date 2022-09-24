/// @description Insert description here
currentIndex=0;
easeFrame = false;
obj_player.paused=true;
currentLevel = global.party[0][LV];
scrollLevel = 0;
level = currentLevel;
var last_room = room_first;
var i = 1;
rooms = [room_first];
names = [getRoomName(room_first)]
while room_next(last_room) != -1 and room_next(last_room) != room_first{
	last_room = room_next(last_room);
	if last_room != battle_area
		and last_room != battle_d1area
		and last_room != battle_d1shelves
		and last_room != basicalleyfightroom
		and last_room != Minigame0
		and last_room != Minigame1Fishing
		and last_room != Minigame2
		and last_room != start_menu{
			names[i]= getRoomName(last_room)
			rooms[i++] = last_room;
	}
}
/*var last_room = room_next(room_first);
var i = 2;
rooms = [room_first,last_room];
names = [getRoomName(room_first),getRoomName(last_room)]
while room_next(last_room) != -1 and room_next(last_room) != room_first and room_next(last_room) != room_next(room_first){
	last_room = room_next(last_room);
	names[i]= getRoomName(last_room);
	rooms[i++] = last_room;
	
}*/

//temporarily putting here till we globalize somehow
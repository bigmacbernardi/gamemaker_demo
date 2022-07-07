/// @description Insert description here
currentIndex=0;
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
	names[i]= getRoomName(last_room)
	rooms[i++] = last_room;
	
}

//temporarily putting here till we globalize somehow
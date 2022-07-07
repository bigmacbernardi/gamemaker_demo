/// @description Insert description here
obj_player.paused=true;
currentLevel = global.party[0][LV];
level = currentLevel;
var last_room = room_first;
var i = 1;
rooms = [room_first];
while room_next(last_room) != -1 and room_next(last_room) != room_first{
	last_room = room_next(last_room);
	rooms[i++] = last_room;
}

//temporarily putting here till we globalize somehow
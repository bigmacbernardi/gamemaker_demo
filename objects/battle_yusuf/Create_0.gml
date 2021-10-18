/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

base[HP] = global.party[YUSUF][HP];
base[MP] = global.party[YUSUF][MP];
base[POW] = global.party[YUSUF][POW];
base[DEF] = global.party[YUSUF][DEF];
base[ACC] = global.party[YUSUF][ACC];
base[SPD] = global.party[YUSUF][SPD];

current[HP] = global.points[YUSUF][HP];
current[MP] = global.points[YUSUF][MP];
current[POW] = base[@ POW]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]
current[ACC] = base[@ ACC]

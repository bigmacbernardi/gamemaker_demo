/// @description When Aoi spawns in battle

// Inherit the parent event
event_inherited();

base[HP] = global.party[AOI][HP];
base[MP] = global.party[AOI][MP];
base[POW] = global.party[AOI][POW];
base[DEF] = global.party[AOI][DEF];
base[ACC] = global.party[AOI][ACC];
base[SPD] = global.party[AOI][SPD];

current[HP] = global.points[AOI][HP];
current[MP] = global.points[AOI][MP];
current[POW] = base[@ POW]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]
current[ACC] = base[@ ACC]

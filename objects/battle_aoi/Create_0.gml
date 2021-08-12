/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

base[HP] = global.party[AOI][HP];
base[ATK] = global.party[AOI][ATK];
base[DEF] = global.party[AOI][DEF];
base[ACC] = global.party[AOI][ACC];
base[SPD] = global.party[AOI][SPD];

current[HP] = base[@ HP]
current[ATK] = base[@ ATK]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]
current[ACC] = base[@ ACC]

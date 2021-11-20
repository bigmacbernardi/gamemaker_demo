/// @description When Aoi spawns in battle

// Inherit the parent event
event_inherited();

base[HP] = global.party[AOI][HP];
base[MP] = global.party[AOI][MP];
base[DEF] = global.party[AOI][DEF];
base[SPD] = global.party[AOI][SPD];
base[STR] = global.party[AOI][STR];
base[AGI] = global.party[AOI][AGI];
base[CHA] = global.party[AOI][CHA];
base[DEX] = global.party[AOI][DEX];
base[WIS] = global.party[AOI][WIS];

base[ACC] = global.party[AOI][ACC]; //change to formuler

current[HP] = global.points[AOI][HP];
current[MP] = global.points[AOI][MP];
current[DEF] = base[@ DEF] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].defBonus:0);
current[SPD] = base[@ SPD] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].spdBonus:0);
current[STR] = base[@ STR] + global.equipped[AOI][0].ATK;
current[AGI] = base[@ AGI] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].agiBonus:0);
current[CHA] = base[@ CHA];
current[DEX] = base[@ DEX];
current[WIS] = base[@ WIS] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].wisBonus:0);
current[ACC] = base[@ ACC]; // TIMES weapon accuracy!

index = AOI;
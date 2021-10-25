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
current[DEF] = base[@ DEF];
current[SPD] = base[@ SPD];
current[STR] = base[@ STR]; //PLUS weapon+attack!
current[AGI] = base[@ AGI];
current[CHA] = base[@ CHA];
current[DEX] = base[@ DEX];
current[WIS] = base[@ WIS];
current[ACC] = base[@ ACC]; // TIMES weapon accuracy!

index = AOI;
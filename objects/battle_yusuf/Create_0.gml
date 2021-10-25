/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

base[HP] = global.party[YUSUF][HP];
base[MP] = global.party[YUSUF][MP];
base[DEF] = global.party[YUSUF][DEF];
base[SPD] = global.party[YUSUF][SPD];
base[STR] = global.party[YUSUF][STR];
base[AGI] = global.party[YUSUF][AGI];
base[CHA] = global.party[YUSUF][CHA];
base[DEX] = global.party[YUSUF][DEX];
base[WIS] = global.party[YUSUF][WIS];

base[ACC] = global.party[YUSUF][ACC]; //change to formuler

current[HP] = global.points[YUSUF][HP];
current[MP] = global.points[YUSUF][MP];
current[DEF] = base[@ DEF];
current[SPD] = base[@ SPD];
current[STR] = base[@ STR]; //PLUS weapon+attack!
current[AGI] = base[@ AGI];
current[CHA] = base[@ CHA];
current[DEX] = base[@ DEX];
current[WIS] = base[@ WIS];
current[ACC] = base[@ ACC]; // TIMES weapon accuracy!


index = YUSUF;//will make slotting easier
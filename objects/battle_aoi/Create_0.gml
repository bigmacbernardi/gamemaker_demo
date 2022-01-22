/// @description When Aoi spawns in battle

// Inherit the parent event
event_inherited();

layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sAoiBattle);

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
current[STR] = base[@ STR] +  (global.equipped[AOI][0]!=noone?global.equipped[AOI][0].ATK:0);
current[AGI] = base[@ AGI] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].agiBonus:0);
current[CHA] = base[@ CHA];
current[DEX] = base[@ DEX];
current[WIS] = base[@ WIS] + (global.equipped[AOI][1]!=noone?global.equipped[AOI][1].wisBonus:0);
current[ACC] = base[@ ACC]; // TIMES weapon accuracy!

if (current[HP]==0){//only added for start of battle
	var myId = id;
	layer_sequence_headpos(unitSequence, deathStart);
	state = DEATH;	
	with battle_manager{
		remove(myId);
		totalUnits--;
	}
}
index = AOI;
status = global.statuses[AOI];
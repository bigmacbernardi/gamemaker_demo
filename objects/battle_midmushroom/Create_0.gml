/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
event_inherited();
depth = -y;
randomize();
state = IDLE;
doingSpecialAttack = false;

xp_value = 60;
cash_value = 60;
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sMushroomSmall);

//start and end frames for each state
idleStart = 0;
idleEnd = 16;
atkStart = 17;
atkEnd = 34;
atk2Start = 35;
atk2End = 63;


drops = [[obj_antidote,48],[obj_potionsmall,25]];
intoDefStart = 63;
intoDefEnd = 68;//make contiguous if need be
defStart = 63;
defEnd = 68;
hitStart = 68;
hitEnd = 73;
missStart = 73;
missEnd = 89;
deathStart = 90;
deathMid = 91;
deathEnd = 92;

base[HP] = 30;
current[HP] = base[HP];

base[MP] = 10;
current[MP] = base[MP];
base[STR] = 4;
current[STR] = base[STR];
current[DEF] = 1;
current[SPD] = 6;
base[ACC] = 0.6;
current[ACC] = 0.6;
//shouldn't NEED function overrides or new stuff; inherited


price=10;//will actually be 200
electrum_prize=[obj_antidring,100];
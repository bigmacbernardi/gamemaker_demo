/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
event_inherited();
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sBeastling);

depth = -y;
randomize();
/* should be inherited*/
//state = IDLE;
//isPlayer = false;
//turnFinished = false;
//selected = false;
//targeted = false;
//attackWillHit = false;
//incomingDamage = 0; incomingHealage = 0; nastyDamage = 0;
//hpBarWidth = sprite_get_width(ui_hp);
//hpBarHeight = sprite_get_height(ui_hp);
doingSpecialAttack = false;

xp_value = 80;
cash_value = 40;

//start and end frames for each state
idleStart = 0;
idleEnd = 16;
atkStart = 17;
atkEnd = 34;
atk2Start = 35;
atk2End = 63;
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

base[HP] = 24;
current[HP] = base[HP];

base[MP] = 10;
current[MP] = base[MP];
base[STR] = 5;
current[STR] = base[STR];
current[DEF] = 1;
current[SPD] = 5;
base[ACC] = 0.6;
current[ACC] = 0.6;
hasGoneOnce = false;

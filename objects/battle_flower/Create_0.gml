/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
event_inherited();
depth = -y;
randomize();
state = IDLE;
/*isPlayer = false;
turnFinished = false;
selected = false;
targeted = false;
attackWillHit = false;
incomingDamage = 0; incomingHealage = 0; nastyDamage = 0;
hpBarWidth = sprite_get_width(ui_hp);
hpBarHeight = sprite_get_height(ui_hp);*/
doingSpecialAttack = false;

xp_value = 60;
cash_value = 60;
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sFlowerYellow);

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
deathMid = 95;
deathEnd = 97;

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
hasGoneOnce = false;
//functions back
/*function damageUnit(amount){//physical attacks
	show_debug_message("Yo it's the flower override!  HP was "+string(current[@ HP]));
	var damage = max(0,ceil(amount * 50/(50+ current[DEF])));//will update eventually
	show_debug_message("Damage is "+string(damage)+" of "+string(amount));
	current[@ HP] -= max(0,damage);
	show_debug_message("HP is now "+string(current[@ HP]));
}*/
function healUnit(amount){
	current[@ HP] = min(base[HP],current[HP]+amount);
}
/* New stuff for poison/regen*/
status = [0,0,0,0,0,0,0,0];
floatTurns = 0;
poisonTurns = -1;
regenTurns = 0;
regenAmt = 0;
immunity = [0.5,0.5,0,0.5,0,0,0,0,0,0.5];//resists earth, wind, water, and ice.

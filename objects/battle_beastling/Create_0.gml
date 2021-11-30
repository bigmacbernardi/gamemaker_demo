/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
depth = -y;
randomize();
state = IDLE;
isPlayer = false;
turnFinished = false;
selected = false;
targeted = false;
attackWillHit = false;
incomingDamage = 0;
hpBarWidth = sprite_get_width(ui_hp);
hpBarHeight = sprite_get_height(ui_hp);
doingSpecialAttack = false;

xp_value = 100;
cash_value = 100;
unitSequence = layer_sequence_create("Sequences",x,y,sBeastling);

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
current[ACC] = 0.6;
hasGoneOnce = false;
//functions back
function damageUnit(amount){//physical attacks
	show_debug_message("Yo it's the soldier override!  HP was "+string(current[@ HP]));
	var damage = max(0,amount - current[@ DEF]);//will update eventually
	show_debug_message("Damage is "+string(damage)+" of "+string(amount));
	current[@ HP] -= max(0,damage);
	show_debug_message("HP is now "+string(current[@ HP]));
}
function healUnit(amount){
	current[@ HP] = min(base[HP],current[HP]+amount);
}
//

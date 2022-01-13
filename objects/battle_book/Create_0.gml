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
//doingSpecialAttack = false;

xp_value = 190;
cash_value = 40;
unitSequence = layer_sequence_create("Sequences",x,y,sBook);

//start and end frames for each state
idleStart = 0;
idleEnd = 35;
atkStart = 36;
atkEnd = 75;
healStart = 76;
healEnd = 115;
intoDefStart = 116;
intoDefEnd = 120;//make contiguous if need be
defStart = 116;
defEnd = 135;
hitStart = 136;
hitEnd = 159;
missStart = 160;
missEnd = 194;
deathStart = 195;
deathMid = 231;
deathEnd = 240;

base[HP] = 50;
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

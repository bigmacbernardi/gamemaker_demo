/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
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
unitSequence = layer_sequence_create("Sequences",x,y,sFootsoldier);

//start and end frames for each state
idleStart = 0;
idleEnd = 14;
atkStart = 15;
atkEnd = 35;
atk2Start = 35;
atk2End = 56;
intoDefStart = 58;
intoDefEnd = 65;
defStart = 66;
defEnd = 72;
hitStart = 73;
hitEnd = 98;
missStart = 99;
missEnd = 112;
deathStart = 113;
deathMid = 126;
deathEnd = 135;

base[HP] = 80;
current[HP] = 80;

base[MP] = 6;
current[MP] = 6;
current[STR] = 10;
current[DEF] = 5;
current[SPD] = 5;
current[ACC] = 0.5;

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

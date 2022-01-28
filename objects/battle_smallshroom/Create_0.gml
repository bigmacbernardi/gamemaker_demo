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
//functions back
function damageUnit(amount){//physical attacks
	show_debug_message("Yo it's the flora override!  HP was "+string(current[@ HP]));
	var damage = max(0,ceil(amount * 50/(50+ current[DEF])));//will update eventually
	show_debug_message("Damage is "+string(damage)+" of "+string(amount));
	current[@ HP] -= max(0,damage);
	show_debug_message("HP is now "+string(current[@ HP]));
}
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
function turnEnd(){
	if status[0] < 0{//poison only
		var amount = 0-status[0]
		nastyDamage = ceil(amount * 50/(50+ current[DEF]));
		if (poisonTurns > 0) poisonTurns--;
		else if (poisonTurns == 0) status[0]=0;//poison ended
	}
	else if status[0]>0{
		incomingHealage=regenAmt;
		healUnit(regenAmt);
		if status[0]>1{
			var amount = status[0]-1;
			nastyDamage = ceil(amount * 50/(50+ current[DEF]));
			damageUnit(amount);
			if (poisonTurns > 0) poisonTurns--;
			else if (poisonTurns == 0) status[0]=1;//poison ended!
			if (regenTurns > 0) regenTurns--;
			else if (regenTurns == 0) and (poisonTurns==0) status[0]=0;//both ended!
			else if (regenTurns == 0) status[0]=1-status[0];//regen ended 
		
		}
	}
	if (floatTurns > 0) floatTurns--;
	else status[1]=0;//float ended
	nastyDamage = 0;
	incomingHealage = 0;
}

price=200;
electum_prize=[obj_antidring,100];
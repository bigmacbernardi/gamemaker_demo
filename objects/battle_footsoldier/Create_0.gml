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
incomingDamage = 0; incomingHealage = 0; nastyDamage = 0;
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
/* New stuff for poison/regen*/
status = [0,0,0,0,0,0,0,0];
floatTurns = 0;
poisonTurns = -1;
regenTurns = 0;
regenAmt = 0;
function turnEnd(){
	if status[0] < 0{//poison only
		var amount = 0-status[0]
		nastyDamage = amount - current[DEF];
		if (poisonTurns > 0) poisonTurns--;
		else if (poisonTurns == 0) status[0]=0;//poison ended
	}
	else if status[0]>0{
		incomingHealage=regenAmt;
		healUnit(regenAmt);
		if status[0]>1{
			var amount = status[0]-1;
			nastyDamage = amount - current[DEF];
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

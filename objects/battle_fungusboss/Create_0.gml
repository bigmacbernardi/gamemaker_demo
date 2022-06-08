/// @description Insert description here
// You can write your code in this editor
//instead of event_inherited, just doing the important battle_unit things
event_inherited();
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,myceliumBoss);

depth = -y;
randomize();
/* //shouldn't need the following:
state = IDLE;
isPlayer = false;
turnFinished = false;
selected = false;
targeted = false;
attackWillHit = false;
incomingDamage = 0; incomingHealage = 0; nastyDamage = 0;
hpBarWidth = sprite_get_width(ui_hp);
hpBarHeight = sprite_get_height(ui_hp);*/
doingSpecialAttack = false;

xp_value = 100;
cash_value = 100;

form = 1;//0=flat 1=man 2=hand 3=def 4=dead

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
transform0to2 = 135;
transform0to3 = 135;
transform0to1 = 135;
idleStart1 = 140;
idleEnd1 = 148;
atkStart1 = 148;
atkEnd1 = 148;
atk2Start1 = 148;
atk2End1 = 148;
intoDefStart1 = 148;
intoDefEnd1 = 148;
defStart1 = 148;
defEnd1 = 148;
hitStart1 = 148;
hitEnd1 = 148;
missStart1 = 148;
missEnd1 = 148;
deathStart1 = 148;
deathMid1 = 148;
deathEnd1 = 148;
transform1to0 = 138;
transform1to3 = 140;
transform1to2 = 140;
idleStart2 = 135;
idleEnd2 = 135;
atkStart2 = 135;
atkEnd2 = 35;
atk2Start2 = 35;
atk2End2 = 56;
intoDefStart2 = 58;
intoDefEnd2 = 65;
defStart2 = 66;
defEnd2 = 72;
hitStart2 = 73;
hitEnd2 = 98;
missStart2 = 99;
missEnd2 = 112;
deathStart2 = 113;
deathMid2 = 126;
deathEnd2 = 135;
transform2to0 = 135;
transform2to1 = 135;
transform2to3 = 135;
transform3to0 = 135;
transform3to1 = 135;
transform3to2 = 135;
idleStart3 = 135;
idleEnd3 = 135;
atkStart3 = 135;
atkEnd3 = 35;
atk2Start3 = 35;
atk2End3 = 56;
intoDefStart3 = 58;
intoDefEnd3 = 65;
defStart3 = 66;
defEnd3 = 72;
hitStart3 = 73;
hitEnd3 = 98;
missStart3 = 99;
missEnd3 = 112;
deathStart3 = 113;
deathMid3 = 126;
deathEnd3 = 135;

base[HP] = 80;
current[HP] = 80;

base[MP] = 20;
current[MP] = 20;
current[STR] = 9;
current[DEF] = 6;
current[SPD] = 5;
current[ACC] = 0.5;
hasGoneOnce = false;
	 //0: GOO FORM
	 //1: SHELL FORM
starts=[0,135,180]
form = 2;//MAN FORM
	 //3: HAND FORM  
start_frame = 0;
layer_sequence_headpos(unitSequence, transform0to2);
state=SPECIAL;
start_frame = transform0to2;


//function redeclarations shouldn't be needed
/*function damageUnit(amount){//physical attacks
	show_debug_message("Yo it's the soldier override!  HP was "+string(current[@ HP]));
	var damage = max(0,ceil(amount * 50/(50+ current[DEF])));//will update eventually
	show_debug_message("Damage is "+string(damage)+" of "+string(amount));
	current[@ HP] -= max(0,damage);
	show_debug_message("HP is now "+string(current[@ HP]));
}
function healUnit(amount){
	current[@ HP] = min(base[HP],current[HP]+amount);
}*/
/* New stuff for poison/regen shouldn't be needed*/
/*status = [1,0,0,0,0,0,0,0];//regenerating
floatTurns = 0;
poisonTurns = -1;
regenTurns = -1;
regenAmt = 5;
immunity = [0,0,-1,2,0,0,0,0,1,-1];//immune to poison.  absorbs water.  weak to fire and ice.
function turnEnd(){
	show_debug_message("big mushroom turn end");
	if status[0] < 0{//poison only
		var amount = 0-status[0]
		nastyDamage = ceil(amount * 50/(50+ current[DEF]));
		damageUnit(amount);
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
}*/
show_debug_message("it's naught thought");
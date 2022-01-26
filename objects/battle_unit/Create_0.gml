#macro Camera_Width camera_get_view_width(view_camera[0])
#macro Camera_Height camera_get_view_height(view_camera[0])

#macro Display_ScaleX display_get_gui_width()/Camera_Width
#macro Display_ScaleY display_get_gui_height()/Camera_Height
depth = -y;
root_x=x;
root_y=y;
//macros for unit stats - set in initializer instead
//#macro HP 0
//#macro STR 1
//#macro DEF 2
//#macro SPD 3
//#macro ACC 4

//macros for animation/sequence states
//I don't need to change them, the "STR"/"ATTACK" ambiguity is fine bc they are equal
#macro IDLE 0
#macro ATTACK 1
#macro HIT 2
#macro MISS 3
#macro TODEFEND 4
#macro DEFEND 5
#macro DEATH 6
#macro ITEM 7
#macro HEAL 8
#macro SPECIAL 9

state = IDLE;

base[HP] = 10;
base[STR] = 2;
base[DEF] = 1;
base[ACC] = 0.5;
base[SPD] = irandom_range(1,10);

current[HP] = base[@ HP]
current[STR] = base[@ STR]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]
current[ACC] = base[@ ACC]

isPlayer = false;
turnFinished = false;
selected = false;
targeted = false;
attackWillHit = false;
incomingDamage = 0;
incomingHealage = 0;
nastyDamage = 0;
hpBarWidth = sprite_get_width(ui_mp);
hpBarHeight = sprite_get_height(ui_mp);

status = [0,// 0 = Normal; <0 = POISON; 1 = REGEN; 2+ = Poison AND Regen
		  0,// 0 = Normal; 1 = Float
		  0,// 0 = Normal; 1 = 
		  0,// 0 = Normal; 1 = Mute, 2 = Numb, 3 = Neurotox 
		  0,// 0 = Normal; 1 = 
		  0,// 0 = Normal; 1 = 
		  0,// 0 = Normal; 1 = 
		  0];//0 = Normal; 1 = 
immunity = [0,0,0,0,0,0,0,0,0,0];//earth,wind,fire,water,shadow,light,energy,void,poison,ice
poisonTurns = -1;
regenTurns = 0;
floatTurns = 0;
regenAmt = 0;



function damageUnit(amount){
	var damage = amount * (50/(50+ current[@ DEF]));
	//audio_play_sound(damageSound,100,false); //done by Helper->unitAttack instead.  timing works a lil better
	current[@ HP] -= max(0,damage);
}
function healUnit(amount){
	current[@ HP] = min(base[HP],current[HP]+amount);
}
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

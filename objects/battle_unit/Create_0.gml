#macro Camera_Width camera_get_view_width(view_camera[0])
#macro Camera_Height camera_get_view_height(view_camera[0])

#macro Display_ScaleX display_get_gui_width()/Camera_Width
#macro Display_ScaleY display_get_gui_height()/Camera_Height

//macros for unit stats - set in initializer instead
//#macro HP 0
//#macro ATK 1
//#macro DEF 2
//#macro SPD 3
//#macro ACC 4

//macros for animation/sequence states
//I don't need to change them, the "ATK"/"ATTACK" ambiguity is fine bc they are equal
#macro IDLE 0
#macro ATTACK 1
#macro HIT 2
#macro MISS 3
#macro TODEFEND 4
#macro DEFEND 5
#macro DEATH 6
#macro ITEM 7

state = IDLE;

base[HP] = 10;
base[ATK] = 2;
base[DEF] = 1;
base[ACC] = 0.5;
base[SPD] = irandom_range(1,10);

current[HP] = base[@ HP]
current[ATK] = base[@ ATK]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]
current[ACC] = base[@ ACC]

isPlayer = false;
turnFinished = false;
selected = false;
targeted = false;
attackWillHit = false;
incomingDamage = 0;
hpBarWidth = sprite_get_width(ui_hp);
hpBarHeight = sprite_get_height(ui_hp);

function damageUnit(amount){
	var damage = amount - current[@ DEF];
	current[@ HP] -= max(0,damage);
}
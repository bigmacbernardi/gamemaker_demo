/// @description Insert description here
// You can write your code in this editor
#macro HP 0
#macro ATK 1
#macro DEF 2
#macro SPD 3

//yeah i dont like how these macros dont map with the stats
//but ill fix it later
#macro IDLE 0
#macro ATTACK 1
#macro HIT 2
#macro MISS 3
#macro TODEFEND 4
#macro DEFEND 5

state = IDLE;

base[HP] = 10;
base[ATK] = 5;
base[DEF] = 5;
base[SPD] = irandom_range(1,10);

current[HP] = base[@ HP]
current[ATK] = base[@ ATK]
current[DEF] = base[@ DEF]
current[SPD] = base[@ SPD]

turnFinished = false;
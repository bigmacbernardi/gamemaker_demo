/// @description Insert description here
// You can write your code in this editor
event_inherited();

//sPlayer is filler animation for the knight
unitSequence = layer_sequence_create("Sequences",x,y,sGhost);

//start and end frames for each state
idleStart = 0;
idleEnd = 24;
atkStart = 26;
atkEnd = 79;
intoDefStart = 81;
intoDefEnd = 101;
defStart = 102;
defEnd = 120;
hitStart = 123;
hitEnd = 159;
missStart = 161;
missEnd = 197;
deathStart = 199;
deathMid = 229;
deathEnd = 244;

base[HP] = 4;
current[HP] = 4;
current[ATK] = 2;
current[DEF] = 1;
current[SPD] = 1;
current[ACC] = 0.5;
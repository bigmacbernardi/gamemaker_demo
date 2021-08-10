/// @description Insert description here
// You can write your code in this editor
event_inherited();

//sPlayer is filler animation for the knight
unitSequence = layer_sequence_create("Sequences",x,y,sKnight);

//start and end frames for each state
idleStart = 0;
idleEnd = 30;
atkStart = 30;
atkEnd = 41;
intoDefStart = 50;
intoDefEnd = 55;
defStart = 56;
defEnd = 59;
hitStart = 42;
hitEnd = 45;
missStart = 46;
missEnd = 49;
deathStart = 61;
deathMid = 69;
deathEnd = 73;

current[HP] = 4;
current[ATK] = 2;
current[DEF] = 1;
current[SPD] = 1;
current[ACC] = 0.5;
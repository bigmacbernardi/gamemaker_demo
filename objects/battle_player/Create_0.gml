/// @description Insert description here
// You can write your code in this editor
event_inherited();


base[ACC] = 0.8;  //only miss 1 in 5
current[ACC] = base[@ ACC]

//sPlayer is filler animation for the knight
unitSequence = layer_sequence_create("Sequences",x,y,sPlayer);
isPlayer = true;
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
itmStart = 75;
itmEnd = 87;
spcStart = 88; //no event, no broadcast
spcEnd = 100;

mpBarWidth = sprite_get_width(ui_mp);
mpBarHeight = sprite_get_height(ui_mp);
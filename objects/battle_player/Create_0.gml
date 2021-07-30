/// @description Insert description here
// You can write your code in this editor
event_inherited();

//sPlayer is filler animation for the knight
unitSequence = layer_sequence_create("Sequences",x,y,sPlayer);

//start and end frames for each state
idleStart = 0;
idleEnd = 30;
atkStart = 31;
atkEnd = 41;
intoDefStart = 42;
intoDefEnd = 47;
defStart = 48;
defEnd = 51;
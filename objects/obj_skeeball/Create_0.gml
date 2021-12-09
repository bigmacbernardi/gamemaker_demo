/// @description Insert description here
// You can write your code in this editor
obj_player.visible=0;
frameHasPassed=false;
var wall = instance_find(sidewall,0);
leftX = wall.x;
rightX = wall.x;
wall = instance_find(sidewall,1);
if wall.x < leftX
	leftX = wall.x;
else if wall.x > rightX
	rightX = wall.x;
score = 0;
ballsRemain=8;
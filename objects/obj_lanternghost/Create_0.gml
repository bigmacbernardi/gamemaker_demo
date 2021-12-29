/// @description spawn invisble and deactivated
event_inherited();

activated = false;
ascending = true;
forward = true;
image_alpha = 0;
level = 0;
//patrolProgress = 0;
/*maxX = x;
maxY = y;
minX = x;
minY = y;*/
if horizontalPatrol{
		maxi = x + 100;
		mini = x - 100;
}
else{
	maxi = y + 100;
	mini = y - 100;
}

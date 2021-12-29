/// @description spawn invisble and deactivated
event_inherited();

activated = false;
ascending = true;
forward = true;
image_alpha = 0;
level = 0;
patrolProgress = 0;
/*maxX = x;
maxY = y;
minX = x;
minY = y;*/
if horizontalPatrol{
		maxi = x + 60;
		mini = x - 60;
}
else{
	maxi = y + 60;
	mini = y - 60;
}

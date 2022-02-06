/// @description Rise and countdown
if val>-1{//wait till amt is sent.
	if !(--countdown%4) y--;
	if (floor(countdown/2)%2)x++;
	else x--;
	if countdown<0 instance_destroy();
}
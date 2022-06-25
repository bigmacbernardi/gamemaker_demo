/// @description Insert description here
// You can write your code in this editor
if fade>0 and not leaving{
	fade++;
	image_alpha += 0.01;
}
else if leaving{
	if fade == 100 instance_destroy();
	else{
		fade++;
		image_alpha -= 0.01;
	}
}
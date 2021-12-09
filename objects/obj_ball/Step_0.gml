/// @description Insert description here
// You can write your code in this editor
if y<100{
	image_xscale = 1;
	image_yscale = 1;
}
else{
	image_xscale = 1+(y-100)/900;
	image_yscale = 1+(y-100)/900;	
}
depth = baseDepth-y;//will eventually be a function of more than this
//phy_linear_velocity_y +=downwardAcceleration;
/// @description Insert description here
// You can write your code in this editor
if y<220{
	mode = 1;
	image_xscale = 1;
	image_yscale = 1;
}
else{
	if (mode == 1) and x>obj_skeeball.leftX and x<obj_skeeball.rightX
		instance_destroy();	//gutter
	else{
		image_xscale = 1+(y-220)/600;
		image_yscale = 1+(y-220)/600;	
		if y>camera_get_view_height(cam){
			obj_skeeball.ballsRemain++;//you get it back!
			instance_destroy();	
		}
	}
}
depth = baseDepth-y;//will eventually be a function of more than this

//phy_linear_velocity_y +=downwardAcceleration;
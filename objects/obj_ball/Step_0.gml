/// @description Insert description here
// You can write your code in this editor
if y<skeevider{
	if y < skeevider-64
		mode = 1;
	depth+=abs(phy_linear_velocity_y/200);//keep moving in
	var proporti = abs((depth-1080)/(baseDepth-skeevider-1080));//needlessly complicated, but works
	image_xscale = proporti;
	image_yscale = proporti;
}
else{
	depth = baseDepth-y;//will eventually be a function of more than this
	if (mode == 1) and x>obj_skeeball.leftX and x<obj_skeeball.rightX
		instance_destroy();	//gutter
	else{
		image_xscale = 1+(y-skeevider)/floor(skeevider*10/11);
		image_yscale = 1+(y-skeevider)/floor(skeevider*10/11);	
		if y>camera_get_view_height(cam){
			obj_skeeball.ballsRemain++;//you get it back!
			instance_destroy();	
		}
	}
}

//phy_linear_velocity_y +=downwardAcceleration;
/// @description Insert description here
// You can write your code in this editor
//phy_linear_velocity_x = 0;
//phy_linear_velocity_y = -obj_skee_meter1.pow;
skeevider=obj_skeevidingline.y;
phy_linear_velocity_x = obj_skee_meter2.powX;
phy_linear_velocity_y = obj_skee_meter2.powY;
instance_destroy(obj_skee_meter2);
if instance_exists(obj_skee_meter1) 
	instance_destroy(obj_skee_meter1);
//downwardAcceleration = 1;
baseDepth=depth;
mode = 0;
//0 = on ramp
//1 = upper part
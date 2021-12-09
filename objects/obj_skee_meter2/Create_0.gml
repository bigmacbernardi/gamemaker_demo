/// @description Initial vars

angle = -90;
selected = false;
increasing = true;
minX = camera_get_view_width(cam)/4;
maxX = 3*camera_get_view_width(cam)/4;
ballX = obj_skee_meter1.ballX;

frameHasPassed = false;
powX = obj_skee_meter1.pow*dcos(angle);
powY = obj_skee_meter1.pow*dsin(angle);
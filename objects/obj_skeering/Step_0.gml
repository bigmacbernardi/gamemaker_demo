/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_ball){
	if obj_ball.depth > obj_ball.baseDepth-(obj_skeevidingline.y-50){
		image_blend=c_white;//materialize the walls!	
	}
	else{
		image_blend=c_aqua;//drop the walls!	
	}
}
else{
	image_blend=c_aqua;//drop the walls!	
}
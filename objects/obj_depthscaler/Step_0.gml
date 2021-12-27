/// @description 
if instance_exists(obj_player){
	var distance = max(horizonY,obj_player.y) - horizonY;
	var scaleGap = maxScale - minScale;
	var scale = (scaleGap * distance / (maxY-horizonY)) + minScale;
	obj_player.image_xscale = scale;
	obj_player.image_yscale = scale;
	obj_player.move_spd = round(scale*4)/2;
}
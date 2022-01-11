/// @description Insert description here
// You can write your code in this editor
if !(instance_exists(obj_shaderlight_partial)and obj_shaderlight_partial.activated)
   and id == instance_nearest(obj_player.x, obj_player.y, obj_shaderlight)
	obj_player.image_blend = merge_color(roomColor,thisColor,1-(min(range,distance_to_object(obj_player))/range))
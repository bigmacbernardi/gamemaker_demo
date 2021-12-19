/// @description Insert description here
// You can write your code in this editor
activated = distance_to_object(obj_player)<=range;
if distance_to_object(obj_player)<100 
	obj_player.image_blend = merge_color(roomColor,thisColor,1-(distance_to_object(obj_player)/100))
else if activated
	obj_player.image_blend = roomColor


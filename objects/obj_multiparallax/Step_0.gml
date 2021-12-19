/// @description Update layer positions
// You can write your code in this editor
//if instance_exists(obj_player){
	var x_diff = camera_get_view_x(cam)+(camera_get_view_width(cam)/2)-x_center;
	var y_diff = camera_get_view_y(cam)+(camera_get_view_height(cam)/2)-y_center;
	var B2 = layer_get_id("B2");
	var B3 = layer_get_id("B3");
	var B4 = layer_get_id("Background");
	layer_x(B2,b2_center_x+(x_diff/4));
	layer_y(B2,b2_center_y+(y_diff/4));
	layer_x(B3,b3_center_x+(x_diff/10));
	layer_y(B3,b3_center_y+(y_diff/10));
	layer_x(B4,b4_center_x+(x_diff/20));
	layer_y(B4,b4_center_y+(y_diff/20));

//}
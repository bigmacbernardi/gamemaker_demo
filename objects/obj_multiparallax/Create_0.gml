/// @description Insert description here
// You can write your code in this editor
depth = 10000
background_map = ds_map_create();
background_map[? layer_get_id("B2")] = 0.3;
background_map[? layer_get_id("B3")] = 0.2;
background_map[? layer_get_id("Background")] = 0.1;
var lay_id = layer_get_id("B2");
var B2 = layer_background_get_id(lay_id);
//layer_background_stretch(B2,false);
layer_background_xscale(B2,1.5);
layer_background_yscale(B2,1.5);
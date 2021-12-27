/// @description So I don't have to rescale the sprites again for a test

var lay_id = layer_get_id("Columns_Front");
var fore = layer_background_get_id(lay_id);
layer_background_xscale(fore,2);
layer_background_yscale(fore,2);
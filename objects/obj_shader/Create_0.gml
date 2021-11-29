/// @description On room load
// You can write your code in this editor
index = 0;


//var color_one=[255,255,255];
//var color_two=[0,100,200];
//for easy demos
var rChunk = (color_two[0] - color_one[0]) / time;
var gChunk = (color_two[1] - color_one[1]) / time;
var bChunk = (color_two[2] - color_one[2]) / time;
repeat(time){
	colors[index] = make_color_rgb(rChunk*(index+1)+color_one[0],gChunk*(index+1)+color_one[1],bChunk*(index+1)+color_one[2]);
	index++;
}
//colors=[c_orange,c_navy,c_white,c_aqua,c_black,c_blue,c_dkgray,c_fuchsia,c_gray,c_green,c_lime,c_maroon,c_olive,c_purple,c_silver,c_teal,c_yellow]
obj_player.image_blend = colors[0];
//countdown = 200;
index = 1;
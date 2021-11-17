/// @description Can be used anywhere.
// You can write your code in this editor

image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); 
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
options = ds_list_create(); 
for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  if ((i % 3)==2){
	drawX = 0;
	drawY += 24;
  }else	drawX += 100;
  
}
mode = 0;//item MUST be selected first.  this ain't equipment
index2 = -1;
index3 = 0;
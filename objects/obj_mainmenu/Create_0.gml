/// @description Can be used anywhere.
// You can write your code in this editor
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
options = ds_list_create(); 
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pauseitem));
drawY += 24;
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pauseequip));
drawY += 24;
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pauseskill));
drawY += 24;
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pausestat));
drawY += 24;
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pauseteam));
drawY += 24;
ds_list_add(options,instance_create_depth(drawX,drawY,depth-1,obj_pauseconfig));
drawY += 24;
/*for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  drawY += 24;
}*/
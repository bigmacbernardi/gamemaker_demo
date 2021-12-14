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
selected=true;
portraits = [spr_aoi,spr_yusuf,spr_old_man44,spr_old_man44,spr_old_man44,spr_old_man44];
lvBreaks = [0,200,600,1400,3000,6200,10000,30000,600000,
1600000,11600000,111600000,222600000,333600000,444600000,
1000000000,1000000001,1000000002,1000000003,1000000004,1000000005,
2000000000,2000000001,3000000002,4000000003,5000000004,5000000005
];//temporarily putting here till we globalize somehow
/// @description Lets you slot your teams and pick the "leader."
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

//was spawning all in position for now, just in case we switch to having slots draw themselves
//var drawX = 0;
//var drawY = y;
scrollLevel = 0; //for full party list (sublist)
//options = global.availableParty;
//for (var i = 0; i < ds_list_size(global.availableParty); i++){
//  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
//  drawY += 24;
//}

subY = y+sprite_height-80/*half spr_menu_temp.height*/;
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];
mode = 0;//can select either
//mode 1: has selected slot from top part
//mode 2: has selected party member from bottom part
index2 = -1;//so none are selected at first
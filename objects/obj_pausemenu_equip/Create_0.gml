/// @description Lets you slot your teams and pick the "leader."
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];
//was spawning all in position for now, just in case we switch to having slots draw themselves
//var drawX = 0;
//var drawY = y;
scrollLevel = 0; 
scrollLevel2 = 0;
//options = global.availableParty;
//for (var i = 0; i < ds_list_size(global.availableParty); i++){
//  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
//  drawY += 24;
//}

options = global.equipment;
subY = y+sprite_height-80/*half spr_menu_temp.height*/;
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];
mode = 0;
//mode 0: can select from list of characters OR list of equipment
//mode 1: has selected character from bottom part
//mode 2: has selected character from bottom AND slot from top part.  can only select equipment from right, or cancel out to previous mode.
//mode 3: has selected equipment from top-right.  must select character from bottom
//mode 4: has selected party member from bottom part AND equipment.  can only select slot from left, or cancel out to mode 3 or 0.
index2 = -1;//so none are selected at first
//index3 = 9;
subindex= 0;//equip slot; weapon,armor,offhand, accessory
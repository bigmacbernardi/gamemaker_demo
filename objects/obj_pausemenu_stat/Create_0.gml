/// @description Can be used anywhere.
// You can write your code in this editor
drawPos = 0
scrollDir = -1;
scrollMax = (sprite_width*sprite_height)/50;
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

//was spawning all in position for now, just in case we switch to having slots draw themselves
//var drawX = 0;
//var drawY = y;
options = global.availableParty; 
stats = ["DEF","SPD","STR","AGI","CHA","DEX","WIS"]
statColors = [c_maroon,c_ltgray,c_red,c_aqua,c_black,c_white,c_yellow];
classes=["Seer","Speaker","Composer","Bard","Ex-Con","Wrestler"];//should be somewhere that responds to promotion.  could be stored with character.
front_sprites = [spr_mori,spr_musa,spr_old_man,spr_old_man44];

index = 0;
scrollLevel = 0;
/*for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  drawY += 24;
}*/
mytree = instance_create_depth(x,y,depth-1,obj_stattree);
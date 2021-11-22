/// @description Can be used anywhere.
// You can write your code in this editor
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
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];

index = 0;
//scrollLevel = 0;
mode = 0;
index2=-1;
global.selectedUnit = global.availableParty[|index];
skillsToShow = slot_skills();
/*for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  drawY += 24;
}*/
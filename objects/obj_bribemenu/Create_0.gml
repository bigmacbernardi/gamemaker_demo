/// @description In-battle bribery menu, ofc
battle_manager.currentMessage="";
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
//var drawX = 0;
//var drawY = y;
electrumAmount = 0; //temporary means for selection; will be functionally replaced by "options"
goldAmount = 0;
changingGold=false;
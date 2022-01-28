/// @description Handles dialogue tree stuff
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
lines=ds_list_create();
index=0;
show_debug_message("Bribribribri");
allowedToGo=false;
choosing=false;
mychoice=0;
choiceTotal = 0;
choices = [];
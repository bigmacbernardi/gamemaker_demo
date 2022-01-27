/// @description Reworking this for battle stuff

//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
optionSlots = ds_list_create(); //temporary means for selection; will be functionally replaced by "options"
for (var i = 0; i < ds_list_size(options); i++){
  show_debug_message("From options: "+string(i));
  ds_list_add(optionSlots,instance_create_depth(drawX,drawY,options[|i][1],options[|i][0]));
  if ((i % 3)==2){
	drawX = 0;
	drawY += 24;
  }else	drawX += 100;
}
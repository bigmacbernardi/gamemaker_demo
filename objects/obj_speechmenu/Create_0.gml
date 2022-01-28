/// @description Can be used anywhere.
// You can write your code in this editor

//ds_grid_I'mthinkin
visible = 1;
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
slot_skills();
optionSlots = ds_list_create(); //temporary means for selection
for (var i = 0; i < array_length(options); i++){
  //if (options[i]==0) continue; //blank mystery that i think is just using wrong decrement/increment
  ds_list_add(optionSlots,options[i]);
  if ((i % 3)==2){
	drawX = 0;
	drawY += 24;
  }else	drawX += 100;
}
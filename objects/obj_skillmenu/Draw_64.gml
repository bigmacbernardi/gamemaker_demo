/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_menu_temp,0,x,y);
var drawX = 10;
var drawY = y+12;
for (var i = scrollLevel; i < ds_list_size(optionSlots); i++){
  //show_debug_message("Drawing "+string(i));
  draw_set_color((i!=index)?c_black:c_white);
  draw_text_transformed(drawX,drawY,optionSlots[|i].title,.75,.75,0);
  if ((i % 3)==2){
	drawX = 10;
	drawY += 24;
  }else	drawX += 130;
}
/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawX = 10;
var drawY = y+12;
for (var i = scrollLevel; i < ds_list_size(optionSlots); i++){
  if (i!=index) draw_set_color(c_black);
  draw_text(drawX,drawY,optionSlots[|i].title);
  draw_text(drawX+104,drawY,optionSlots[|i].numOwned);
  draw_set_color(c_white);//for other text
  if ((i % 3)==2){
	drawX = 10;
	drawY += 24;
  }else	drawX += 130;
}
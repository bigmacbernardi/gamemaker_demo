/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_menu_temp,0,x,y);
var drawX = 10;
var drawY = y+12;
for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(c_black);
  draw_text_transformed(drawX,drawY,options[|i].title,.75,.75,1);
  draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,1);
  draw_set_color(c_white);//for other text
  if ((i % 3)==2){
	drawX = 10;
	drawY += 24;
  }else	drawX += 130;
}
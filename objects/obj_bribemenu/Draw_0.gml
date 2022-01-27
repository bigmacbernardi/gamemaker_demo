/// @description Insert description here
// You can write your code in this editor
//draw_self();
draw_set_color(c_green);
draw_rectangle(10,10,90,50,false);
draw_set_color(c_white);
draw_rectangle(10,10,90,50,true);
draw_rectangle(9.75,9.75,90.25,50.25,true);
draw_rectangle(9.5,9.5,90.5,50.5,true);
draw_set_font(Roses);
draw_text_transformed(15,15,"How much?",.4,.4,0);
draw_text_transformed(15,25,string(electrumAmount)+" E",.5,.5,0);
draw_text_transformed(15,38,string(goldAmount)+" G",.5,.5,0);
draw_sprite(spr_select_right,0,11,changingGold?25:38);
var drawX = 10;
var drawY = y+12;
for (var i = scrollLevel; i < ds_list_size(optionSlots); i++){
  if (i!=index) draw_set_color(c_black);
  draw_text_transformed(drawX,drawY,optionSlots[|i].title,.75,.75,0);
  draw_set_color(c_white);//for other text
  if ((i % 3)==2){
	drawX = 10;
	drawY += 24;
  }else	drawX += 130;
}
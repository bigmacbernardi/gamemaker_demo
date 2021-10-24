/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawX = x+10;
var drawY = y+12;
draw_set_color(c_white);
for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(c_black);
  draw_text_transformed(drawX,drawY,options[|i].title,.75,.75,1);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,1);
  draw_set_color(c_white);//for other text
  //drawX = x+20;
  drawY += 24;
}
draw_text_transformed(drawX-6,drawY+24,options[|index].description,.5,.5,1);
//drawing potraits and stats
for (var i = 0; i<4; i++){
	drawX = (i%2==0)? x+100:x+208;
	drawY = (i<2)? y+10:y+104;
	draw_set_color((global.currentParty[i] != noone)?c_white:c_gray);
	draw_text_transformed(drawX,drawY,"Member "+string(i+1),.5,.5,1);
	if (global.currentParty[i] != noone){
		drawY +=12;
		draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][HP])+"/"+string(global.party[global.currentParty[i]][HP]),.5,.5,1);
		drawY +=12;
		draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][MP])+"/"+string(global.party[global.currentParty[i]][MP]),.5,.5,1);
		drawY +=12;
		draw_text_transformed(drawX,drawY,"Next LV in: "+string(1000-global.party[global.currentParty[i]][XP])+"xp",.5,.5,1);

	}
}
/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawX = x+10;
var drawY = y+12;
draw_set_color(c_white);
for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(c_black);
  draw_text_transformed(drawX,drawY,options[|i].title,.75,.75,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  draw_set_color(c_white);//for other text
  //drawX = x+20;
  drawY += 24;
}
draw_text_transformed(drawX+10,drawY+24,options[|index].description,.5,.5,0);
//drawing potraits and stats
for (var i = 0; i<4; i++){
	drawX = (i%2==0)? x+140:x+273;
	drawY = (i<2)? y+24:y+138;
	draw_set_color((global.currentParty[i] != noone)?c_white:c_gray);
	//draw_text_transformed(drawX,drawY,"Member "+string(i+1),.5,.5,0);
	if (global.currentParty[i] != noone){
		draw_sprite(portraits[global.currentParty[i]],0,drawX+18,drawY+28);//nudging to right bc using sprites for now
		draw_text_transformed(drawX+43,drawY,global.names[global.currentParty[i]],.5,.5,0);
		drawY +=12;
		draw_text_transformed(drawX+43,drawY,"HP: "+string(global.points[global.currentParty[i]][HP])+"/"+string(global.party[global.currentParty[i]][HP]),.5,.5,0);
		drawY +=12;
		draw_text_transformed(drawX+43,drawY,"MP: "+string(global.points[global.currentParty[i]][MP])+"/"+string(global.party[global.currentParty[i]][MP]),.5,.5,0);
		drawY +=12;
		draw_text_transformed(drawX,drawY,"Next LV in: "+string(lvBreaks[global.party[global.currentParty[i]][LV]]-global.party[global.currentParty[i]][XP])+"xp",.5,.5,0);

	}
}
//display
draw_set_color(c_white);
drawX = x + camera_get_view_width(cam)-120;
drawY = y + camera_get_view_height(cam)-24;
draw_text_transformed(drawX,drawY,"Money: ",.5,.5,0);
drawX = x + camera_get_view_width(cam)-70;
draw_text_transformed(drawX,drawY,string(global.electum)+"E",.5,.5,0);
draw_text_transformed(drawX,drawY+10,string(global.gold)+"G",.5,.5,0);

draw_set_color(c_ltgray);
drawX = x + 8;
drawY += 13;
draw_text_transformed(drawX,drawY,"Accept: ENTER/L-click     Back: Bkspc/Shift/R-click",.4,.4,0);

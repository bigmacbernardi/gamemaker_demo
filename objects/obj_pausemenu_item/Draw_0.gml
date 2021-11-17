/// @description formerly Draw GUI
draw_self();
var drawX = x+10;
var drawY = y+16;
for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(options[|i].usable?c_blue:c_dkgray);
  else draw_set_color(options[|i].usable?c_white:c_gray);
  if (global.currentParty[i] != noone){
	  draw_set_color(index2==i?c_white:c_black);
	  draw_text_transformed(drawX,drawY,global.names[global.currentParty[i]],.75,.75,0);
	  drawY += 12;
	  draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][HP])+"/"+string(global.party[global.currentParty[i]][HP]),.6,.6,0);
	  drawY += 9;
	  draw_text_transformed(drawX,drawY,"MP: "+string(global.points[global.currentParty[i]][MP])+"/"+string(global.party[global.currentParty[i]][MP]),.6,.6,0);
	  drawY += 18;
  }
  else continue;
  //for other text
  //if ((i % 3)==2){
	//drawX = x+160;
  //}else	drawX += 80;
}
drawX = x+160;
drawY = y+46;
draw_set_color(c_black);
draw_rectangle(drawX-10,drawY-1,x+camera_get_view_width(cam)-2,y+camera_get_view_height(cam),false);
for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(options[|i].usable?c_blue:c_dkgray);
  else draw_set_color(options[|i].usable?c_white:c_gray);
  draw_text_transformed(drawX,drawY,options[|i].title,.6,.6,0);
  draw_text_transformed(drawX+90,drawY,options[|i].numOwned,.6,.6,0);
  draw_set_color(c_white);//for other text
  //if ((i % 3)==2){
	//drawX = x+160;
	drawY += 24;
  //}else	drawX += 80;
}

draw_sprite(spr_menu_temp,0,x,y+sprite_height-40);
draw_set_color(c_white);
draw_text_transformed(x+10,y+sprite_height-30,options[|index].description,.6,.6,0);
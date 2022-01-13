/// @description formerly Draw GUI
draw_self();

/* PLAYERS */
var drawX = x+10;
var drawY = y+16;
for (var i = 0; i < 4; i++){
  if (global.currentParty[i] != noone){
	  draw_set_color(index2==i?c_aqua:c_white);
	  draw_text_transformed(drawX,drawY,global.names[global.currentParty[i]],.75,.75,0);
	  drawY += 12;
	  draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][HP])+"/"+string(global.party[global.currentParty[i]][HP]),.6,.6,0);
	  drawY += 9;
	  draw_text_transformed(drawX,drawY,"MP: "+string(global.points[global.currentParty[i]][MP])+"/"+string(global.party[global.currentParty[i]][MP]),.6,.6,0);
	  drawY += 18;
  }
  else continue;
}
/* ITEMS */
drawX = x+160;
drawY = y+6;//was 46;
draw_set_color(make_color_rgb(34, 54, 161));
draw_rectangle(drawX-10,drawY-1,x+camera_get_view_width(cam)-6,y+camera_get_view_height(cam),false);

if ds_list_size(options)>0{
  for (var i = scrollLevel; i < ds_list_size(options); i++){
  if (i!=index) draw_set_color(options[|i].usable?c_black:c_dkgray);
  else draw_set_color(options[|i].usable?c_white:c_gray);
  draw_text_transformed(drawX,drawY,options[|i].title,.6,.6,0);
  draw_text_transformed(x+camera_get_view_width(cam)-26,drawY,options[|i].numOwned,.6,.6,0);
  drawY += 24;
}
draw_set_color(c_white);//for next text, JIC
}
/* SORTING */
drawX = x+160;
drawY = y+camera_get_view_height(cam)-54;//was 46;
draw_set_color(c_ltgray);
draw_line(drawX,drawY-10,x+camera_get_view_width(cam)-16,drawY-10);
for (var i = 0; i < array_length(filterOptions); i++){
  draw_set_color(index3==i?c_white:c_gray);
  draw_text_transformed(drawX,drawY,filterOptions[i],.5,.5,0);
  drawX += (camera_get_view_width(cam)-160)/array_length(filterOptions);
}
draw_set_color(c_white);//for next text
/* DESCRIPTION */

if ds_list_size(options)>0{
show_debug_message("Index: "+string(index)+"; options length: "+string(ds_list_size(options)));
draw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-40);
draw_set_color(c_white);
draw_text_transformed(x+10,y+camera_get_view_height(cam)-30,options[|index].description,.6,.6,0);
}
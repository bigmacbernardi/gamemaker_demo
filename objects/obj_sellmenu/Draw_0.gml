/// @description formerly Draw GUI
draw_self();
//MONEY
draw_set_color(c_white);
draw_text(x,y,string(global.electrum)+"E    0$");



/* PLAYERS */
var drawX = x+10;
var drawY = y+16;
for (var i = 0; i < 4; i++){
  if (global.currentParty[i] != noone){
	  draw_set_color(c_white);
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
  for (var i = scrollLevel; i < ds_list_size(options); i++){//problem is obviously here, made for items but not equipments
	  show_debug_message(i);	  
	  draw_set_color((i!=index)?c_white:c_black);
	  show_debug_message("colored");	
	  //drawX-=50;//???
	  draw_text_transformed(drawX-30,drawY,string(options[|i][0].value)+"E",.6,.6,0);  
	  draw_text_transformed(drawX,drawY,options[|i][0].title,.6,.6,0);  
	  draw_text_transformed(x+camera_get_view_width(cam)-26,drawY,variable_instance_exists(options[|i][0],"numOwned")?options[|i][0].numOwned:"-",.6,.6,0);
	  drawY += 24;
	}
	draw_set_color(c_white);//for next text, JIC
}
/* SORTING */
drawX = x+160;
drawY = y+camera_get_view_height(cam);
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
	draw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-40);
	draw_set_color(c_white);
	draw_text_transformed(x+10,y+camera_get_view_height(cam)-30,options[|index][0].description,.6,.6,0);
}

if (mode == 1){
	drawX= x+30;
	drawY= y +10;
	draw_set_color(c_orange);
	draw_rectangle(drawX,drawY,drawX+camera_get_view_width(cam)-20,drawY+40,false);
	drawY+=18;
	draw_set_color(index2==0?c_white:c_gray);
	draw_text_transformed(drawX,drawY,numToSell,.6,.6,0);
	drawX+=(camera_get_view_width(cam)-40)/3;
	draw_set_color(index2==1?c_white:c_gray);
	draw_text_transformed(drawX,drawY,"Sell 'em",.6,.6,0);
	drawX+=(camera_get_view_width(cam)-40)/3;
	draw_set_color(index2==2?c_white:c_gray);
	draw_text_transformed(drawX,drawY,"Never mind",.6,.6,0);
}
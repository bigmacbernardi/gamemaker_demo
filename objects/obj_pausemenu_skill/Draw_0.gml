/// @description Insert description here
// You can write your code in this editor
draw_self();//should be PARCHMENT background
draw_set_font(Roses); //should be DIFFERENT font
var drawX = x+10;
var drawY = y+12;
draw_set_color(c_yellow);

/*drawing character header*/

draw_text_transformed(drawX,drawY,global.names[options[|index]],.8,.8,0);
//draw_text_transformed(drawX+94,drawY,"Level 1",.7,.7,0);
drawY += 18;
draw_set_color(c_black);
draw_text_transformed(drawX,drawY,"Magic",.7,.7,0);
drawX = x+20;
drawY+=15;

draw_set_color(c_white);
for (var i = 0; i < array_length(skillsToShow[0]); i++){
  //if (i!=index) draw_set_color(c_black);//maybe re-enable for guide mode
  //draw_set_color(statColors[i]);
  draw_text_transformed(drawX,drawY,skillsToShow[0][i].title,.5,.5,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if (i%3==2){
	drawX = x+20;
	drawY += 16;
  }else drawX = camera_get_view_width(cam)/6;
}
drawX = x+10;
drawY = y + 100;
draw_set_color(c_black);
draw_text_transformed(drawX,drawY,"Trained skills",.7,.7,0);

drawX+=10; drawY+=15;
draw_set_color(c_white);
for (var i = 0; i < array_length(skillsToShow[1]); i++){
  show_debug_message("showing "+string(i)+" of "+string(array_length(skillsToShow)));
  //var bendY = lineY+((jointY-lineY)/2)+(10*i);
  //if (i!=index) draw_set_color(c_black);//maybe re-enable for guide mode
  //draw_set_color(statColors[i]);
  draw_text_transformed(drawX,drawY,skillsToShow[1][i].title,.5,.5,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if (i%2==1){
	drawX = x+20;
	drawY += 16;
  }else drawX = camera_get_view_width(cam)/4;
}

/* dividing line */
var halfway = x+camera_get_view_width(cam)/2;
draw_line(halfway,y,halfway,y+camera_get_view_height(cam));
 
/* right side: showing last 3 categories */

draw_set_color(c_black);
drawX = halfway + 10;
drawY = y+6;
draw_text_transformed(drawX,drawY,"Observed skills",.7,.7,0);
drawX+=10; drawY+=30;
draw_set_color(c_white);
for (var i = 0; i < array_length(skillsToShow[2]); i++){
  //draw_set_color(statColors[i]);
  draw_text_transformed(drawX,drawY,skillsToShow[2][i].title,.5,.5,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if (i%2==1){
	drawX  = halfway + 20;
	drawY += 16;
  }else drawX = halfway + camera_get_view_width(cam)/4;
}
drawY = y + 80;
drawX = halfway+10;
draw_set_color(c_fuchsia);
draw_text_transformed(drawX,drawY,"Unique skills",.7,.7,0);
drawY+=30; drawX += 10;
draw_set_color(c_white);
for (var i = 0; i < array_length(skillsToShow[3]); i++){
  //show_debug_message("showing "+string(i)+" of "+string(array_length(skillsToShow)));
  draw_text_transformed(drawX,drawY,skillsToShow[3][i].title,.5,.5,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if (i%2==1){
	drawX  = halfway + 20;
	drawY += 16;
  }else drawX = halfway + camera_get_view_width(cam)/4;
}
draw_set_color(c_black);
drawY=y+camera_get_view_height(cam)-84;
drawX = halfway + 10;
draw_text_transformed(drawX,drawY,"Common skills",.5,.5,0);
drawX+=10; drawY+=20;
draw_set_color(c_white);
for (var i = 0; i < array_length(skillsToShow[4]); i++){
  draw_text_transformed(drawX,drawY,skillsToShow[4][i].title,.5,.5,0);
  if (i%2==1){
	drawX = halfway + 20;
	drawY += 16;
  }else drawX = halfway + camera_get_view_width(cam)/4;
}



/* bottom: showing characters and which is selected */
//drawing submenu
draw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-42);
drawX = x+30;
drawY = y+camera_get_view_height(cam)-30;
//draw_set_color(c_white);
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index) draw_sprite_ext(front_sprites[options[|i]],0,drawX,drawY,1,1,0,c_dkgray,.8); //do different indicator
  else draw_sprite(front_sprites[options[|i]],0,drawX,drawY);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if ((i%4)==3){
	drawX = x+30;
	drawY += 30;
  }else drawX += 30
}
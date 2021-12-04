/// @description Should eventually show perks that come with teams
// You can write your code in this editor
draw_self();//background
var drawX = x+10;
draw_set_color(c_white);
var drawY = y+5;
var equipments = ["Weapon:","Armor:","Accessory:","Offhand:"];
for (var i = 0; i < 4; i++){// upper slots
  var iAm = global.currentParty[i];
  draw_set_color((i!=index)?c_black:c_white);//just to have SOME feedback

  if (iAm!=noone) {
	draw_text_transformed(drawX,drawY,global.names[iAm],.5,.5,0);
	drawY+=12;
	var normalColor = ((i!=index)?c_black:c_white);
	for (var j = 0; j < 4; j++){
		draw_set_color((j==subindex and i==index)?c_yellow:normalColor);
		//draw_sprite(front_sprites[global.currentParty[i]],0,drawX+40,drawY-3);
		draw_text_transformed(drawX,drawY,equipments[j],.5,.5,0);
		if (global.equipped[iAm][j]==noone) {
			draw_set_color(c_dkgray);
			draw_text_transformed(drawX+70,drawY,"None",.5,.5,0);
		}
		else{
			draw_text_transformed(drawX+70,drawY,global.equipped[iAm][j].title,.5,.5,0);
		}
		drawY+=10;
	}	
  }
  //draw_set_color(c_white);
  drawY += 20;
}
//drawing submenu
draw_sprite(spr_menu_temp,0,x,subY);
drawX = x+10;
drawY = subY+14;
//draw_set_color(c_white);
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index2) draw_set_color(c_black);
  else draw_set_color(c_white);
  draw_text_transformed(drawX,drawY,options[|i].title+(options[|i].currentUser==noone?"":"~"),.70,.70,0);
  if ((i%3)==2){
	drawX = x+10;
	drawY += 30;
  }else drawX += 140;
}

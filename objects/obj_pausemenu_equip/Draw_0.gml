/// @description Should eventually show perks that come with teams
// You can write your code in this editor
/*xs = [100,
25,100,175,
100,
35,165,
100];*/
/*ys = [20,
60,50,60,
78,
100,100,
130];*/
var xs = [35,165,100,100,100,25,100,175];
var ys = [100,100,50,78,130,40,20,40];

draw_self();//background
var drawX = x+10;
draw_set_color(c_white);
var drawY = y+5;
var equipments = ["Weapon","Offhand","Head","Armor","Lower","Accessory","Boon","Accessory"];
//for (var i = 0; i < 4; i++){// upper slots
  var iAm = global.availableParty[|index];

  if (iAm!=noone) {
	draw_text_transformed(drawX,drawY,global.names[iAm],.5,.5,0);
	drawY+=12;
	var normalColor = c_white;//((i!=index)?c_black:c_white);
	for (var j = 0; j < 7; j++){
		drawX = x+xs[j];
		drawY = y+ys[j];
		draw_sprite((j==subindex)?spr_perk_on:spr_perk_off,0,drawX,drawY);	
		
		draw_set_color((j==subindex)?c_yellow:normalColor);
		//draw_sprite(front_sprites[global.currentParty[i]],0,drawX+40,drawY-3);
		draw_text_transformed(drawX,drawY-10,equipments[j],.5,.5,0);
		if (global.equipped[iAm][j]==noone) {
			draw_set_color(c_dkgray);
			draw_text_transformed(drawX+18,drawY,"None",.5,.5,0);
		}
		else{
			draw_text_transformed(drawX+18,drawY,global.equipped[iAm][j].title,.5,.5,0);
		}
	}	
  }
  //draw_set_color(c_white);
  drawY += 20;
//}
//drawing submenu
draw_sprite(spr_menu_temp,0,x,subY);
drawX = x+10;
drawY = subY+14;
//draw_set_color(c_white);
//drawing right menu
drawX = x + camera_get_view_height(cam) - 80;
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index2) draw_set_color(c_black);
  else draw_set_color(c_white);
  draw_text_transformed(drawX,drawY,options[|i].title+(options[|i].currentUser==noone?"":"~"),.70,.70,0);
 /* if ((i%3)==2){
	drawX = x+10;
	drawY += 30;
  }else drawX += 140;*/
  	drawY += 25;
  
}
drawX = x + 10;
drawY = y + camera_get_view_height(cam) - 30;
for (var i = scrollLevel2; i < min(ds_list_size(global.availableParty),scrollLevel2+8); i++){
	draw_sprite_ext(front_sprites[i],0,drawX,drawY,1,1,0,(i!=index)?c_gray:c_white,1)
	drawX += 30;
}
if index2!=-1 or (subindex>0){//draw description box
	
}
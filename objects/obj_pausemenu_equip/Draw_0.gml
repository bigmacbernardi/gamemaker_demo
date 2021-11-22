/// @description Should eventually show perks that come with teams
// You can write your code in this editor
draw_self();//background
var options = global.equipment;
var drawX = x+10;
draw_set_color(c_white);
var drawY = y+5;
var equipments = ["Weapon:","Armor:","Accessory:","Offhand:"];
for (var i = 0; i < 4; i++){// upper slots
  var iAm = global.currentParty[i];
  draw_set_color(c_white);
  if (i!=index) draw_set_color(c_black);//just to have SOME feedback

  if (iAm!=noone) {
	draw_text_transformed(drawX,drawY,global.names[iAm],.5,.5,0);
	drawY+=12;
	for (var j = 0; j < 4; j++){
		//draw_sprite(front_sprites[global.currentParty[i]],0,drawX+40,drawY-3);
		draw_text_transformed(drawX,drawY,equipments[j],.5,.5,0);
		if (global.equipped[iAm][j]==noone) {
			draw_set_color(c_dkgray);
			draw_text_transformed(drawX+50,drawY,"None",.5,.5,0);
		}
		else{
			draw_text_transformed(drawX+50,drawY,global.equipped[iAm][j].title,.5,.5,0);
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
//draw_text_transformed(drawX-2,drawY+24,options[|index].description,.5,.5,0);
//drawing portraits and stats -- save it
/*for (var i = 0; i<4; i++){
	drawX = (i%2==0)? x+100:x+208;
	drawY = (i<2)? y+10:y+104;
	draw_set_color((global.currentParty[i] != noone)?c_white:c_gray);
	draw_text_transformed(drawX,drawY,"Member "+string(i+1),.5,.5,0);
	if (global.currentParty[i] != noone){
		drawY +=12;
		draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][HP])+"/"+string(global.party[global.currentParty[i]][HP]),.5,.5,0);
		drawY +=12;
		draw_text_transformed(drawX,drawY,"HP: "+string(global.points[global.currentParty[i]][MP])+"/"+string(global.party[global.currentParty[i]][MP]),.5,.5,0);
		drawY +=12;
		draw_text_transformed(drawX,drawY,"Next LV in: "+string(1000-global.party[global.currentParty[i]][XP])+"xp",.5,.5,0);

	}
}*/
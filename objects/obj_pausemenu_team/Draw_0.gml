/// @description Should eventually show perks that come with teams
// You can write your code in this editor
draw_self();//background
var options = global.availableParty;
var drawX = x+10;
draw_set_color(c_white);
draw_text(drawX,y+5,"Assign Your Teams");
var drawY = y+35;
var alpha;
for (var i = 0; i < 4; i++){
  draw_set_color(c_white);
  if (i == 0)||(i==2){
	  draw_text_transformed(drawX,drawY, (i == 0)?"Team 1":"Team 2",.5,.5,0);
	  drawY += 12;
  }
  if (i!=index){
	  draw_set_color(c_black);
	  alpha = .5;  
  }else{
	  alpha = 1;
  }
  if (global.currentParty[i]==noone) draw_text_transformed(drawX,drawY,"[empty]",.6,.6,0);
  else{
	//draw_sprite(front_sprites[global.currentParty[i]],0,drawX+40,drawY-3);
	draw_sprite_ext(front_sprites[global.currentParty[i]],0,drawX+50,drawY-2,.5,.5,0,c_white,alpha);
	draw_text_transformed(drawX,drawY,global.names[global.currentParty[i]],.6,.6,0);
  }
  //draw_set_color(c_white);
  drawY += 20;
}
//drawing team preview
if (index != 4) && (global.currentParty[index]!=noone){
	var halfway =  x+camera_get_view_width(cam)/2;
	var allway =  x+camera_get_view_width(cam)-8;
	draw_set_color(c_black);
	draw_rectangle(halfway,y+22,allway,subY,false);
	draw_set_color(make_color_rgb(172, 45, 207));
	draw_rectangle(halfway+2,y+24,allway-2,subY-2,false);
	draw_set_color(c_dkgray);
	draw_text(halfway+16,y+27,"Dual Techniques");
	var techniques = ["Icy Heat","Mugu mugu"];//reassign from function
	draw_set_color(c_white);
	var strin = "";
	for (var i =0;i<array_length(techniques);i++){
		strin += techniques[i];
		//if (i+1)<array_length(techniques)
			strin+= " - ";
	}
	draw_text_transformed(halfway+24,y+50,strin,.45,.45,0);
	
}

//drawing submenu
draw_sprite(spr_menu_temp,0,x,subY);
drawX = x+30;
drawY = subY+14;
//draw_set_color(c_white);
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index2) draw_sprite_ext(front_sprites[options[|i]],0,drawX,drawY,1,1,0,c_dkgray,.8); //do different indicator
  else draw_sprite(front_sprites[options[|i]],0,drawX,drawY);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if ((i%4)==3){
	drawX = x+30;
	drawY += 30;
  }else drawX += 30
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
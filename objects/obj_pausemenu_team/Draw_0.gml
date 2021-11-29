/// @description Should eventually show perks that come with teams
// You can write your code in this editor
draw_self();//background
var options = global.availableParty;
var drawX = x+10;
draw_set_color(c_white);
draw_text(drawX,y+5,"Assign Your Teams");
var drawY = y+33;
var alpha;
for (var i = 0; i < 4; i++){
  draw_set_color(c_white);
  if (i==2) drawY += 16;
  if (i == 0)||(i==2){
	  draw_text_transformed(drawX,drawY, (i == 0)?"Team 1":"Team 2",.5,.5,0);
	  drawY += 14;
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
  drawY += 13;
}
//drawing team preview
if (index != 4) && (global.currentParty[index]!=noone){
	var halfway =  x+camera_get_view_width(cam)/2;
	var allway =  x+camera_get_view_width(cam)-8;
	draw_set_color(c_ltgray);
	draw_rectangle(halfway,y+22,allway,subY,false);
	draw_set_color(make_color_rgb(172, 45, 207));
	draw_rectangle(halfway+2,y+24,allway-2,subY-2,false);
	draw_set_color(c_black);
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
  }
  else drawX += 30
}

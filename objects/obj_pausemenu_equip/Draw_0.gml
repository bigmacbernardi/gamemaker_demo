/// @description Should eventually show perks that come with teams
// You can write your code in this editor
/*I's = [6,
5,2,7,
3,
0,1,
4];*/
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
	draw_text_transformed(x+185,y+130,global.names[iAm],1,1,0);
	draw_text_transformed(x+208,y+150, string(global.party[iAm][STR]+ (global.equipped[iAm][0]>0?global.equipped[iAm][0].ATK:0)),.38,.38,0);
	draw_text_transformed(x+208,y+160, string(global.party[iAm][DEF]+ (global.equipped[iAm][1]>0?global.equipped[iAm][1].defBonus:0)+ (global.equipped[iAm][2]>0?global.equipped[iAm][2].defBonus:0)+ (global.equipped[iAm][3]>0?global.equipped[iAm][3].defBonus:0)+ (global.equipped[iAm][4]>0?global.equipped[iAm][4].defBonus:0)+ (global.equipped[iAm][5]>0?global.equipped[iAm][5].defBonus:0)),.38,.38,0);
	if index2>=0 and index2<ds_list_size(options){
		draw_set_color(c_aqua);
		if options[|index2].category==0{
			draw_text_transformed(x+220,y+150,"->"+string(global.party[iAm][STR]+ options[|index2].ATK),.38,.38,0);
		}
		else if options[|index2].category<6{
			draw_text_transformed(x+220,y+160,"->"+string(global.party[iAm][DEF]+ (global.equipped[iAm][1]>0?global.equipped[iAm][1].defBonus:0)+ (global.equipped[iAm][2]>0?global.equipped[iAm][2].defBonus:0)+ (global.equipped[iAm][3]>0?global.equipped[iAm][3].defBonus:0)+ (global.equipped[iAm][4]>0?global.equipped[iAm][4].defBonus:0)+ (global.equipped[iAm][5]>0?global.equipped[iAm][5].defBonus:0)
			- (global.equipped[iAm][options[|index2].category]>0?global.equipped[iAm][options[|index2].category].defBonus:0)+options[|index2].defBonus),.38,.38,0);
		}
	}
	draw_set_color(c_gray);
	draw_text_transformed(x+190,y+150, "ATK:",.38,.38,0);
	draw_text_transformed(x+190,y+160, "DEF:",.38,.38,0);
	drawY+=12;
	var normalColor = c_white;//((i!=index)?c_black:c_white);
	for (var j = 0; j < 7; j++){
		drawX = x+xs[j];
		drawY = y+ys[j];
		draw_sprite((j==subindex)?spr_perk_on:spr_perk_off,0,drawX,drawY);	
		
		draw_set_color((j==subindex)?c_yellow:normalColor);
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
//drawing bottom submenu
draw_sprite(spr_menu_temp,0,x,subY);
//drawing RIGHT submenu
drawX = x+camera_get_view_width(cam)-128;
drawY = y+10;
//draw_set_color(c_white);
//drawing right menu
//drawX = x + camera_get_view_height(cam) - 80;
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index2) draw_set_color(c_black);
  else draw_set_color(c_white);
  draw_text_transformed(drawX,drawY,options[|i].title+(options[|i].currentUser<0?"":"~"),.60,.60,0);
 /* if ((i%3)==2){
	drawX = x+10;
	drawY += 30;
  }else drawX += 140;*/
  drawY += 20;
  
}
drawX = x + 20;
drawY = y + camera_get_view_height(cam) - 15;
for (var i = scrollLevel2; i < min(ds_list_size(global.availableParty),scrollLevel2+8); i++){
	draw_sprite_ext(front_sprites[i],0,drawX,drawY,1,1,0,(i!=index)?c_gray:c_white,1)
	drawX += 20;
}
if index2!=-1 and index2<ds_list_size(options){//draws description box from menu
	 draw_set_color(c_fuchsia);
	 draw_set_alpha(.85);
	 draw_rectangle(x+3,subY,x+camera_get_view_width(cam)-3, y + camera_get_view_height(cam)-1,false);
	 draw_set_color(c_blue);
	 draw_text_transformed(x+11,subY+5,options[|index2].title,.5,.5,0);
	 if (options[|index2].category==0){	
		draw_set_color(merge_color(c_red,c_maroon,.5));
		var subquipments = ["Sword","Staff","Polearm","Morning Star","Pistol","Rifle","Thing","Bow","Instrument"];
		draw_text_transformed(x+197,subY+5,"["+subquipments[options[|index2].type]+"]",.44,.30,0);	 
	 }
	 draw_set_color(c_black);
	 draw_text_transformed(x+130,subY+5,"TYPE: "+equipments[options[|index2].category],.45,.3,0);
	 draw_set_alpha(1);
	 draw_text_transformed(x+10.5,subY+5.5,options[|index2].title,.5,.5,0);
	 draw_set_color(c_white);
	 draw_rectangle(x+3,subY,x+camera_get_view_width(cam)-3, y + camera_get_view_height(cam)-1,true);
	 var text = options[|index2].description;
	 text = string_replace(text,".  ",".\n ");//so I don't have to reformat the existing descriptions, so I can avoid pushing my current initializer changes till investigated
	 draw_text_transformed(x+11,subY+21,text,.5,.5,0);
}
else if (subindex>=0){//draws description box under slot selected
}
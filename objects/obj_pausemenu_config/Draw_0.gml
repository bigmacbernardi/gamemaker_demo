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



draw_self();//background
var drawX = x+10;
draw_set_color(c_white);
var drawY = y+5;
//var equipments = ["Weapon","Offhand","Head","Armor","Lower","Accessory","Boon","Accessory"];
//for (var i = 0; i < 4; i++){// upper slots
var iAm = global.availableParty[|index];

if (iAm!=noone) {
	draw_text_transformed(x+185,y+100,global.names[iAm],1,1,0);
	drawY+=12;
	var normalColor = c_white;//((i!=index)?c_black:c_white);
	drawY += 150;
	drawX+=60;
	for (var j = 0; j < ds_list_size(options); j++){
		drawY += 20;	
		draw_set_color((j==subindex)?c_white:c_dkgray);
		draw_text_transformed(drawX+18,drawY,options[|j][0],.5,.5,0);
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

drawX = x + 20;
drawY = y + camera_get_view_height(cam) - 15;
for (var i = scrollLevel2; i < min(ds_list_size(global.availableParty),scrollLevel2+8); i++){
	draw_sprite_ext(front_sprites[i],0,drawX,drawY,1,1,0,(i!=index)?c_gray:c_white,1)
	drawX += 20;
}
if index2!=-1 or (subindex>0){//draw description box
		
}
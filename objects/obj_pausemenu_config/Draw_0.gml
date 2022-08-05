/// @description Should eventually show perks that come with teams

draw_self();//background
var drawX = x+10;
draw_set_color(c_white);
var drawY = y+5;
//var equipments = ["Weapon","Offhand","Head","Armor","Lower","Accessory","Boon","Accessory"];
var iAm = global.availableParty[|index];

if (iAm!=noone) {
	draw_text_transformed(x+185,y+100,global.names[iAm],1,1,0);
	drawY += 160;
	drawX += 60;
	for (var j = 0; j < ds_list_size(options); j++){
		drawY += 20;	
		draw_set_color((j==subindex)?c_white:c_dkgray);
		draw_text_transformed(drawX+18,drawY,options[|j][0],.5,.5,0);
	}	
}
drawY += 20;
//drawing bottom submenu
draw_sprite(spr_menu_temp,0,x,subY);
//drawing RIGHT submenu
//drawX = x+camera_get_view_width(cam)-128;
//drawY = y+10;
drawX = x + 20;
drawY = y + camera_get_view_height(cam) - 15;
for (var i = scrollLevel2; i < min(ds_list_size(global.availableParty),scrollLevel2+8); i++){
	draw_sprite_ext(front_sprites[i],0,drawX,drawY,1,1,0,(i!=index)?c_gray:c_white,1)
	drawX += 20;
}
if (subindex>=0 and subindex<ds_list_size(options)){//draw description boxdraw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-40);
	draw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-40);
	draw_set_color(c_white);
	draw_text_transformed(x+10,y+camera_get_view_height(cam)-30,getDescription(options[|subindex][1]),.5,.5,0);	
}
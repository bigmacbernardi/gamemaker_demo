/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawX;
var drawY = y + 4;
for (var i = 0; i<array_length(players);i++){
		drawX = x + 10;
		draw_set_color(global.selectedUnit==players[i]?c_yellow:c_white);
		draw_text_transformed(drawX,drawY+1,players[i].title,.65,.65,0);
		drawX += 52;
		draw_set_color(c_ltgray);
		draw_text_transformed(drawX,drawY,string(players[i].current[HP])+"/"+string(players[i].base[HP])+"HP",.45,.45,0);
		drawY+=10;
		draw_text_transformed(drawX,drawY,string(players[i].current[MP])+"/"+string(players[i].base[MP])+"MP",.45,.45,0);
		drawY+=12;
}
if menuDisplaying{
	draw_sprite_stretched(spr_menu_temp,0,x+100,y-10,190,90);
	
	drawX = x + 112;
	drawY = y - 1;
	for (var i = 0 ; i<4;i++){
		draw_set_color(i == index?c_white:c_gray);
		draw_text_transformed(drawX,drawY,names[i],.65,.65,0);
		drawY+=12
	}
	
	drawX += 85;
	drawY = y - 1;
	for (var i = 4 ; i<6;i++){
		draw_set_color(i == index?c_white:c_gray);
		draw_text_transformed(drawX,drawY,names[i],.65,.65,0);
		drawY+=12
	}
}	
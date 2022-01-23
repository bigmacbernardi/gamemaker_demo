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
		draw_set_color(players[i].state==DEATH?c_red:c_ltgray);
		draw_text_transformed(drawX,drawY,string(max(0,players[i].current[HP]))+"/"+string(players[i].base[HP])+"HP",.45,.45,0);
		if players[i].current[HP]/players[i].base[HP] <= 0.55{
			draw_set_color(players[i].current[HP]/players[i].base[HP] <= 0.20?c_red:c_yellow);
			draw_text_transformed(drawX,drawY,string(max(0,players[i].current[HP])),.45,.45,0);	
		}
		drawY+=10;
		draw_set_color(players[i].state==DEATH?c_red:c_ltgray);
		draw_text_transformed(drawX,drawY,string(players[i].current[MP])+"/"+string(players[i].base[MP])+"MP",.45,.45,0);
		if players[i].state!=DEATH and players[i].current[MP]/players[i].base[MP] <= 0.10{
			draw_set_color(players[i].current[MP]==0?c_red:c_yellow);
			draw_text_transformed(drawX,drawY,string(max(0,players[i].current[MP])),.45,.45,0);	
		}
		drawY+=12;
}
if menuDisplaying{
	draw_sprite_stretched(spr_menu_temp,0,x+200,y-10,150,90);
	
	drawX = x + 217;
	drawY = y ;
	for (var i = 0 ; i<4;i++){
		draw_set_color(i == index?c_white:c_gray);
		draw_text_transformed(drawX,drawY,names[i],.65,.65,0);
		drawY+=13
	}
	
	drawX += 67;
	drawY = y ;
	for (var i = 4 ; i<6;i++){
		draw_set_color(i == index?c_white:c_gray);
		draw_text_transformed(drawX,drawY,names[i],.65,.65,0);
		drawY+=13
	}
}	
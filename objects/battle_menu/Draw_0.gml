/// @description Insert description here
// You can write your code in this editor
draw_rectangle_color(x,y-2,x+sprite_width,y+64,c_blue,c_blue,c_black,c_black,false);//draw_self();
var drawX;
var drawY = y+2;
for (var i = 0; i<array_length(players);i++){
		drawX = x + 10;
		var base_color=players[i].status[0]<0||players[i].status[0]>1?c_fuchsia:c_white;
		draw_set_color(global.selectedUnit==players[i]?c_yellow:base_color);
		draw_text_transformed(drawX,drawY+1,players[i].title,.65,.65,0);
		drawX += 52;
		base_color=players[i].status[0]<0||players[i].status[0]>1?c_fuchsia:c_ltgray;
		draw_set_color(players[i].state==DEATH?c_red:base_color);
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
	//draw_sprite_stretched(spr_menu_temp,0,x+submenuDisplaying?400:200,y-(submenuDisplaying&&bigSubmenu?60:10),150,120+(submenuDisplaying&&bigSubmenu * 50));
	draw_sprite_stretched(spr_menu_temp,0,x+20+submenuDisplaying?30+(30*(4-cols)):90,y-6 - (bigSubmenu * 12),submenuDisplaying?200:150,120);
	drawX = x + submenuDisplaying?(30*(4-cols))+44:105;
	for (var c = 0; c<cols;c++){
		drawY = y - (rows * 12) + 46;
		for (var i = c*rows ; i<min(rows*(c+1),array_length(actions));i++){
			draw_set_color(i == index?c_white:c_gray);
			draw_text_transformed(drawX,drawY,actions[i].name+(array_length(actions[i].children)==0?"":"..."),.65,.65,0);
			drawY+=5
			if actions[i].element>-1{
				draw_set_color(element_colors[actions[i].element]);
				draw_circle(drawX-5,drawY,2,false)
			}
			//show_debug_message(actions[i].name+" level is "+string(actions[i].lvl));
			
			if actions[i].lvl>0||levels[i]>0{
				for (var j=0;j<max(actions[i].lvl,levels[i]);j++){
					draw_set_color((i == index)?(j == secondIndex?c_white:c_dkgray):c_black);
					draw_text_transformed(drawX+46+(j*6),drawY-2,string(j+1),.4,.4,0);
				}
			}
			drawY+=8
		}
		drawX += 70;
	}
}	
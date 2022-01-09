/// @description Insert description here

var drawX = x+15;
var drawY;
var s = ds_list_size(options);
if (alignment ==0){
	//var writingX = x+20;
	drawY = y+20;
	for (var i = 0; i <s;i++){
		if i==mychoice{
			draw_sprite(spr_select_right,0,drawX-8/*-16*/,drawY+6);
			//draw_sprite_stretched(spr_select_right,drawX-16,drawY+4,8,8);
			draw_set_color(c_white);
		}
		else draw_set_color(c_dkgray);
		draw_text(drawX,drawY,options[|i]);
		if (i % 4) == 3{
			drawX += 80;
			drawY = y+20;
		}
		else drawY+=15;
	}
}
if (alignment ==1){
	//var writingX = x+20;
	drawY = y+20;
	for (var i = 0; i <s;i++){
		draw_set_color(i==mychoice?c_white:c_dkgray);
		draw_text(drawX,drawY,options[|i]);
		if (i % 4) == 3{
			drawX = x+15;
			drawY += 15
		}
		
		else drawX += 80;
		
	}
}
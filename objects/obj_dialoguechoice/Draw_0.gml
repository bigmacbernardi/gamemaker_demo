/// @description Insert description here

var drawX = x+15;
var drawY;
var s = ds_list_size(options);
if (alignment ==0){
	//var writingX = x+20;
	drawY = y+20;
	for (var i = 0; i <s;i++){
		draw_set_color(i==mychoice?c_white:c_dkgray);
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
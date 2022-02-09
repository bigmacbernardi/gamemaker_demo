/// @description Insert description here
// You can write your code in this editor
draw_set_font(Roses);
var drawX=(camera_get_view_height(cam)/3)-50;
var drawY=camera_get_view_height(cam)/3;
draw_set_color(c_white);
draw_text_transformed(drawX-8,drawY-60,"METROPOLE",3.5,3.5,0);
if mode==0{//idle
	draw_set_color(c_ltgray);
	draw_text(drawX,drawY,"PRESS ANY BUTTON TO START");
}
else if mode==1{
	for (var i = 0; i<array_length(options);i++){
		draw_set_color(index==i?c_ltgray:c_gray);
		draw_text_transformed(drawX,drawY,options[i],1,1,0);
		drawY+=20;
	}
}
else if mode>1{
	var ensuing_options = [options1,options2,options3];
	var opts = ensuing_options[mode-2];
	for (var i = 0; i<array_length(opts);i++){
		draw_set_color(index==i?c_ltgray:c_gray);
		draw_text_transformed(drawX,drawY,opts[i],1,1,0);
		if mode==2 drawY+=20 else drawX+=20;
	}
}
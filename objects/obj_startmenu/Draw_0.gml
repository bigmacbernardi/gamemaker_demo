/// @description Insert description here
// You can write your code in this editor
var drawX=camera_get_view_height(cam)/3;
var drawY=camera_get_view_height(cam)/3;
if mode==0{//idle
	draw_set_color(c_ltgray);
	
}
else if mode==1{
	for (var i = 0; i<array_length(options);i++){
		draw_set_color(index==i?c_ltgray:cgray);
		draw_text_transformed(drawX,drawY,options[i],.6,.6,0)
		drawY+=20;
	}
}
else if mode>1{
	var ensuing_options = [options1,options2,options3];
	var opts = ensuing_options[mode-1];
	for (var i = 0; i<array_length(opts);i++){
		draw_set_color(index==i?c_ltgray:cgray);
		draw_text_transformed(drawX,drawY,opts[i],.6,.6,0)
		if mode==2 drawY+=20 else drawX+=20;
	}
}
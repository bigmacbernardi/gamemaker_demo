/// @description Only drawing the choice boxes
// You can write your code in this editor
//draw_self();
if choosing{
	draw_set_color(c_navy);
	draw_rectangle(x,y-5,x+160,y+60,false);
	draw_set_color(c_white);
	draw_rectangle(x,y-5,x+160,y+60,true);
	draw_rectangle(x-.25,y-5.25,x+160.25,y+60.25,true);
	draw_rectangle(x-.5,y-5.5,x+160.5,y+60.5,true);
	draw_set_font(Roses);
	draw_text_transformed(x+15,y-1,"Whats say you?",.4,.4,0);
	draw_sprite(spr_select_right,0,x-1,y+9+(mychoice*16));
	var drawX = x+10;
	var drawY = y+10;
	for (var i = 0; i < array_length(choices); i++){
	  draw_set_color((i!=mychoice)?c_black:c_white);
	  draw_text_transformed(drawX,drawY,choices[i],.6,.6,0);
	  draw_set_color(c_white);//for other text
	  drawY += 16;
	}
}
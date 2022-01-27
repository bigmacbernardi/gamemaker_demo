/// @description Only drawing the choice boxes
// You can write your code in this editor
//draw_self();
if choosing{
	draw_set_color(c_navy);
	draw_rectangle(x,y,x+90,y+50,false);
	draw_set_color(c_white);
	draw_rectangle(x,y,x+90,y+50,true);
	draw_rectangle(x-.25,y-.25,x+90.25,y+50.25,true);
	draw_rectangle(x-.5,y-.5,x+90.5,y+50.5,true);
	draw_set_font(Roses);
	draw_text_transformed(x+15,x+15,"Whats say you?",.4,.4,0);
	draw_sprite(spr_select_right,0,x+11,y+4+(mychoice*16));
	var drawX = x+10;
	var drawY = y+4;
	for (var i = 0; i < array_length(choices); i++){
	  draw_set_color((i!=index)?c_black:c_white);
	  draw_text_transformed(drawX,drawY,choices[i],.6,.6,0);
	  draw_set_color(c_white);//for other text
	  drawY += 16;
	}
}
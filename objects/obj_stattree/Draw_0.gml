/// @description Insert description here
// You can write your code in this editor
var drawX = x+20;
var drawY =y+43;

var lineY = drawY+20;
var jointX = drawX + 76;//where they meet
var jointY = y+camera_get_view_height(cam)-60;
var destY = jointY+10;
var bendY = lineY+round((jointY-lineY)*2/3);
draw_set_color(c_black);
for (var i = 0; i < 7; i++){
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  drawX += 4;
  repeat(4){
	  draw_line(drawX,lineY,drawX,bendY);
	  draw_line(drawX,bendY,jointX,jointY);
	  draw_line(jointX,jointY,jointX,destY);
	  drawX+=.5;
  }
  drawX += 18;
}
/// @description Insert description here
// You can write your code in this editor
var drawX = x+20;
var jointX = drawX + 76;//where they meet
//var jointY = y+camera_get_view_height(cam)-60;
var destY = endY+10;
var bendY = startY+round((endY-startY)*2/3);
draw_set_color(c_black);
for (var i = 0; i < 7; i++){
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  drawX += 4;
  repeat(4){
	  draw_line(drawX,startY,drawX,bendY);
	  draw_line(drawX,bendY,jointX,endY);
	  draw_line(jointX,endY,jointX,destY);
	  drawX+=.5;
  }
  drawX += 18;
}
for (var i = 0;i<16;i++){
	with perks[i]{
		draw_sprite(selected?spr_perk_on:spr_perk_off,0,x,y);
		//show_debug_message(string(i)+": "+string(perks[i].x)+","+string(perks[i].y));
	}
}
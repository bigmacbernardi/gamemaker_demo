/// @description Insert description here
// You can write your code in this editor
var drawX = x+20;
var jointX = drawX + 76;//where they meet
//var jointY = y+camera_get_view_height(cam)-60;
var destY = endY+10;
var bendY = startY+round((endY-startY)*2/3);
draw_set_color(c_black);
for (var i = 0; i < 7; i++){
  var progress = (min(amounts[i],curmax[i])-curmin[i])/(curmax[i]-curmin[i]);
  var fillY = lerp(startY,endY,progress);
  
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  drawX += 4;
  var starting_drawX=drawX;
  draw_set_color(c_black);
  repeat(4){
	  draw_line(drawX,startY,drawX,bendY);
	  draw_line(drawX,bendY,jointX,endY);
	  draw_line(jointX,endY,jointX,destY);
	  drawX+=.5;
  }
  draw_set_alpha(0.5);
  draw_set_color(merge_color(c_yellow,c_white,0.5));
  draw_rectangle(starting_drawX,startY,drawX,min(fillY,bendY),false);
  if fillY>bendY{
	draw_set_alpha(0.75);
  var moreprogress = (min(fillY,endY)-bendY)/(endY-bendY);
	drawX=starting_drawX;
	repeat(4){
	  var newX = lerp(drawX,jointX,moreprogress);
	  draw_line(drawX,bendY,newX,fillY);
	  drawX+=.5;
	}
  }
  drawX += 18;
  draw_set_alpha(1);
}
var picked = noone;
for (var i = 0;i<16;i++){
	with perks[i]{
		draw_sprite(selected?spr_perk_on:sprite_index,0,x,y);
		//show_debug_message(string(i)+": "+string(perks[i].x)+","+string(perks[i].y));
	}if perks[i].selected picked = perks[i];
}
if picked !=noone{//draw afterward to draw on top of sprites
	with picked{
		draw_set_color(sprite_index==spr_perk_off?c_dkgray:c_navy);
		draw_rectangle(x+10,y-5,x+232,y+28,false);
		draw_set_color(c_white);
		draw_rectangle(x+10,y-5,x+232,y+28,true);			
		draw_text_transformed(x+26,y,title,.5,.5,0);		
		draw_text_transformed(x+22,y+11,description,.4,.4,0);
		if sprite_index==spr_perk_got{
			draw_set_color(c_yellow);		
			draw_text_transformed(x+179,y-1,"Unlocked!",.5,.5,0);
		}
	}
}
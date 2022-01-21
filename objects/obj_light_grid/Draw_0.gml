/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("V")){
	var i = 0;
	var drawX = obj_player.x-(array_length(xs)*4);
	var drawY = obj_player.y;
	draw_set_color(c_red);
	draw_text_transformed(drawX-18,drawY,"map:",.3,.3,0);
	repeat(array_length(ys)){
		repeat(array_length(xs)){
			draw_set_color(actualColors[i++]);
			draw_rectangle(drawX,drawY,drawX+4,drawY+4,false);
			drawX += 4;
		}
		drawX = obj_player.x-(array_length(xs)*4);
		drawY +=4;
	}
	drawX = obj_player.x-(array_length(xs)*4);
	drawY +=3;
	i = 0;
	draw_set_color(c_red);
	draw_text_transformed(drawX-21,drawY,"colors:",.3,.3,0);
	repeat (array_length(colors)){
			draw_set_color(colors[i++]);
			draw_rectangle(drawX,drawY,drawX+2,drawY+3,false);
			drawX += 4;
	}
}
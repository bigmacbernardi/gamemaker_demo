/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("V")){
	var i = 0;
	var drawX = obj_player.x-(array_length(xs)*4);
	var drawY = obj_player.y;
	repeat(array_length(ys)){
		repeat(array_length(xs)){
			draw_set_color(actualColors[i++]);
			draw_rectangle(drawX,drawY,drawX+4,drawY+4,false);
			drawX += 4;
		}
		drawX = obj_player.x-(array_length(xs)*4);
		drawY +=4;
	}
}
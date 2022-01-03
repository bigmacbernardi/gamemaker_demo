/// @description Insert description here
// You can write your code in this editor
if stepsToGo>-1{
	draw_set_color(c_red);
	draw_text(obj_player.x,obj_player.y+20,string(stepsToGo));
}
/*if activated{
	draw_sprite(spr_dropshadow,0,obj_player.x,obj_player.y-(dropToGo*3));
}*/
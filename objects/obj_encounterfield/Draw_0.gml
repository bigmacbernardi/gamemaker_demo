/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("V")){
	draw_set_color(c_red);
	draw_text(x,y,string(lastStep - obj_player.stepsTaken));
}
if activated{
	draw_sprite(spr_dropshadow,0,obj_player.x,obj_player.y-(dropToGo*3));
}
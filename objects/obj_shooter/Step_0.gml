/// @description Insert description here
// You can write your code in this editor
x = obj_player.x+3;
y = obj_player.y-20;
if !instance_exists(obj_shootygame_go){
	obj_player.paused=false;//leftover
	instance_destroy();
}
depth = -y;
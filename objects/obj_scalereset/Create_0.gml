/// @description On room load
// You can write your code in this editor

obj_player.image_xscale = roomscale;
obj_player.image_yscale = roomscale;
obj_player.move_spd = round(4*roomscale)/2;
instance_destroy();

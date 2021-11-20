/// @description Insert description here
// You can write your code in this editor
myinteract= 3;//set for first step
opened = global.chests[chestNo];
if (opened){
	sprite_index = spr_chest_open;
}
//sprite_index = opened ? spr_chest_open : spr_chest_closed;

depth = -y;
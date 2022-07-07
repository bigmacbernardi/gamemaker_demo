/// @description Unpause boy
with obj_lvdebug{
	instance_destroy();	
}
with obj_roomdebug{
	instance_destroy();	
}
if noClipOn obj_player.mask_index=spr_empty;
else obj_player.mask_index=obj_player.sprite_index;
obj_player.paused=false;
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_sprites(){
	if (!instance_exists(obj_player))return;
	with obj_player{
		if (variable_global_exists("currentParty")){
			switch (global.currentParty[0]){
				case AOI: front_sprite = spr_aoi;
						  left_sprite = spr_aoi_left;
						  right_sprite = spr_aoi_right;
						  back_sprite = spr_aoi_back;
						  break;//hoping to add diagonals soon too, but prolly not worth yet
				case YUSUF: front_sprite = spr_yusuf;
						  left_sprite = spr_yusuf_left;
						  right_sprite = spr_yusuf_right;
						  back_sprite = spr_yusuf_back;
						  break;
				case JAMIR:
				case BARDO:
				default:  front_sprite = spr_aoi;
						  left_sprite = spr_aoi_left;
						  right_sprite = spr_aoi_right;
						  back_sprite = spr_aoi_back;
						  break;
				}
			}
			else{
					front_sprite = spr_aoi;
					left_sprite = spr_aoi_left;
					right_sprite = spr_aoi_right;
					back_sprite = spr_aoi_back;
			}
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_sprites(){
	if (!instance_exists(obj_player))return;
	with obj_player{
		var direct = 0;
		if (sprite_index == spr_aoi) direct = 0;//first time set
		else{ //declared elsewhere
		if (sprite_index == front_sprite) direct = 0;
		else if (sprite_index == left_sprite) direct = 1;
		else if (sprite_index == right_sprite) direct = 2;
		else if (sprite_index == back_sprite) direct = 3;
		}
		
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
			var sprites = [front_sprite,left_sprite,right_sprite,back_sprite];
			sprite_index = sprites[direct];
	}
}
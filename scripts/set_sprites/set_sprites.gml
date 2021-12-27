// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_sprites(){
	if (!instance_exists(obj_player))return;
	with obj_player{
		var direct = 0;
		if (sprite_index == spr_aoi) direct = 0;//first time set
		else{ //declared elsewhere
		if (sprite_index == front_sprites[locomode]) direct = 0;
		else if (sprite_index == left_sprites[locomode]) direct = 1;
		else if (sprite_index == right_sprites[locomode]) direct = 2;
		else if (sprite_index == back_sprites[locomode]) direct = 3;
		}
		
		if (variable_global_exists("currentParty")){
			switch (global.currentParty[0]){
				case AOI: front_sprites = [spr_aoi,spr_aoi1,spr_aoi2];
						  left_sprites = [spr_aoi_left,spr_aoi_left1,spr_aoi_left2];
						  right_sprites = [spr_aoi_right,spr_aoi_right1,spr_aoi_right2];
						  back_sprites = [spr_aoi_back,spr_aoi_back1,spr_aoi_back2];
						  break;//hoping to add diagonals soon too, but prolly not worth yet
				case YUSUF: front_sprites = [spr_yusuf,spr_yusuf1,spr_yusuf2];
						  left_sprites = [spr_yusuf_left,spr_yusuf_left1,spr_yusuf_left2];
						  right_sprites = [spr_yusuf_right,spr_yusuf_right1,spr_yusuf_right2];
						  back_sprites = [spr_yusuf_back,spr_yusuf_back1,spr_yusuf_back2];
						  break;
				case JAMIR:
				case BARDO:
				default:  front_sprites = [spr_aoi,spr_aoi1,spr_aoi2];
						  left_sprites = [spr_aoi_left,spr_aoi_left1,spr_aoi_left2];
						  right_sprites = [spr_aoi_right,spr_aoi_right1,spr_aoi_right2];
						  back_sprites = [spr_aoi_back,spr_aoi_back1,spr_aoi_back2];
						  break;
				}
			}
			else{
					front_sprites = [spr_aoi,spr_aoi1,spr_aoi2];
					left_sprites = [spr_aoi_left,spr_aoi_left1,spr_aoi_left2];
					right_sprites = [spr_aoi_right,spr_aoi_right1,spr_aoi_right2];
					back_sprites = [spr_aoi_back,spr_aoi_back1,spr_aoi_back2];
			}
			var sprites = [front_sprites,left_sprites,right_sprites,back_sprites];
			sprite_index = sprites[direct][locomode];
	}
}
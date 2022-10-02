// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_sprites(){
	if (!instance_exists(obj_player))return;
	with obj_player{
		var direct = 0;
		if (sprite_index == spr_mori) direct = 0;//first time set
		else{ //declared elsewhere
		if (sprite_index == front_sprites[locomode]) direct = 0;
		else if (sprite_index == left_sprites[locomode]) direct = 1;
		else if (sprite_index == right_sprites[locomode]) direct = 2;
		else if (sprite_index == back_sprites[locomode]) direct = 3;
		}
		
		if (variable_global_exists("currentParty")){
			switch (global.currentParty[0]){
				case MORI: front_sprites = [spr_mori,spr_mori1,spr_mori2];
						  left_sprites = [spr_mori_left,spr_mori_left1,spr_mori_left2];
						  right_sprites = [spr_mori_right,spr_mori_right1,spr_mori_right2];
						  back_sprites = [spr_mori_back,spr_mori_back1,spr_mori_back2];
						  break;//hoping to add diagonals soon too, but prolly not worth yet
				case MUSA: front_sprites = [spr_musa,spr_musa1,spr_musa2];
						  left_sprites = [spr_musa_left,spr_musa_left1,spr_musa_left2];
						  right_sprites = [spr_musa_right,spr_musa_right1,spr_musa_right2];
						  back_sprites = [spr_musa_back,spr_musa_back1,spr_musa_back2];
						  break;
				case JAMIR:
				case BARDO:
				default:  front_sprites = [spr_mori,spr_mori1,spr_mori2];
						  left_sprites = [spr_mori_left,spr_mori_left1,spr_mori_left2];
						  right_sprites = [spr_mori_right,spr_mori_right1,spr_mori_right2];
						  back_sprites = [spr_mori_back,spr_mori_back1,spr_mori_back2];
						  break;
				}
			}
			else{
					front_sprites = [spr_mori,spr_mori1,spr_mori2];
					left_sprites = [spr_mori_left,spr_mori_left1,spr_mori_left2];
					right_sprites = [spr_mori_right,spr_mori_right1,spr_mori_right2];
					back_sprites = [spr_mori_back,spr_mori_back1,spr_mori_back2];
			}
			var sprites = [front_sprites,left_sprites,right_sprites,back_sprites];
			sprite_index = sprites[direct][locomode];
	}
}
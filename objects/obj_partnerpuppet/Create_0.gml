/// @description Insert description here
// You can write your code in this editor
x_spd = 0;
y_spd = 0;
move_spd = 2;
paused = false;
framesToBuffer = 0;
locomode = 0;
facing = 2;//numpad directions.  
inst = noone;
//everything below this line should be based on currentParty[0]
var direct = 0;
/*if (sprite_index == spr_musa) direct = 0;//first time set
else{ //declared elsewhere
	if (sprite_index == front_sprites[locomode]) direct = 0;
	else if (sprite_index == left_sprites[locomode]) direct = 1;
	else if (sprite_index == right_sprites[locomode]) direct = 2;
	else if (sprite_index == back_sprites[locomode]) direct = 3;
}*/
		
if (variable_global_exists("currentParty")){
	switch (global.currentParty[1]){
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
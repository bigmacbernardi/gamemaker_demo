/// @description Set sprite and frame.   Will grow more complex if we ever add diagonals
var direct = obj_player.facing / 2 - 1; //south,west.east,,north
var sprites = [obj_player.back_sprites,obj_player.right_sprites,obj_player.left_sprites,obj_player.front_sprites];//north,east,west,south
sprite_index = sprites[direct][obj_player.locomode];
image_index = obj_player.image_index;
image_blend = obj_player.image_blend;
draw_self();

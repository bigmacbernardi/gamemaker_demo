global.battleRoom = battle_d1shelves;
with obj_bookcase{
	if image_blend == c_white
		image_blend = make_color_rgb(200,150,100);
}
with obj_sideshelf{
	if image_blend == c_white
		image_blend = make_color_rgb(200,150,100);
}
obj_player.image_blend = c_white;//make_color_rgb(200,150,100);
global.battleRoom = battle_area;
obj_player.image_blend=c_purple;
obj_backwall.image_blend = c_black;
with obj_persistentmusicplayer{
	if (trackNo != 9){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(icecavetake1,1,true);
		trackNo = 9;	
	}
}
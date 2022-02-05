global.battleRoom = battle_area;
with obj_persistentmusicplayer{
	if (trackNo != 4){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(bouncerock_shoptheme,1,true);
		trackNo = 4;	
	}
}
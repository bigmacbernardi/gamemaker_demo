global.battleRoom = battle_area;
with obj_persistentmusicplayer{
	if (trackNo != 16){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(bazaartheme,1,true);
		trackNo = 16;	
	}
}
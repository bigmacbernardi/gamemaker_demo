global.battleRoom = battle_area;
with obj_persistentmusicplayer{
	if (trackNo != 1){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(overworld_breezetemp,1,true);
		trackNo = 1;	
	}
}
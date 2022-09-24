global.battleRoom = battle_area;
with obj_persistentmusicplayer{
	if (trackNo != 11){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(seedyclub,1,true);
		trackNo = 11;	
	}
}
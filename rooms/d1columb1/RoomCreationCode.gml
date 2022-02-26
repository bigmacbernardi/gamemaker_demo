global.battleRoom = battle_d1area;
with obj_player{
	if y>1170
		facing=8;
}
with obj_persistentmusicplayer{
	if (trackNo != 5){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(d1music2,1,true);
		trackNo = 5;	
	}
}
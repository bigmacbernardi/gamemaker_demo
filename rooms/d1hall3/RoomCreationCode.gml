global.battleRoom = battle_d1area;
with obj_player{
	if y>1300
		facing=8;
}
with obj_persistentmusicplayer{
	if (trackNo != 2){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(d1music1,1,true);
		trackNo = 2;	
	}
}
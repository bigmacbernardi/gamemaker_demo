/// @description Insert description here
currentIndex=min(0,obj_persistentmusicplayer.trackNo);
easeFrames = 0;
obj_player.paused=true;
currentLevel = global.party[0][LV];
scrollLevel = 0;
songs = obj_persistentmusicplayer.possible_tracks;
var i = array_length(songs);
if songs[i-1]==noone i--;
actualMax = i; //for tracking later
songs[i++] = alteredbeast_gameover_as_placeholder;
songs[i++] = battle_torgotemp;
songs[i++] = torgo;
songs[i++] = make_this_funky;
songs[i++] = mt_funky_fast;
songs[i++] = wooloop_lofi;
names = [];
for (i = 0; i<array_length(songs);i++){
	names[i]= audio_get_name(songs[i]);
}
//temporarily putting here till we globalize somehow
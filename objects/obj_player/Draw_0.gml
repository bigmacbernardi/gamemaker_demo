/// @description Best place to put step logic?
draw_self();
var running = keyboard_check(vk_shift);
var steps = running?[lightstep2,lightstep3,midstep1,medstep]: [bigstep,bigscratch,medstep,midstep1];
if (x_spd != 0 or y_spd != 0) and
  (image_index == 0 or image_index == (running?13:8)){
	if not stepping{
		stepping = true;
		stepsTaken+=1+running;
		if place_meeting(x,y,obj_encounterfield) audio_play_sound(steps[irandom(3)],40,false);
	}
} else stepping = false;
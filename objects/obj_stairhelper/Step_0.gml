/// @description Insert description here
if place_meeting(x,y,obj_player){
	var dir = (image_xscale<0)
	with obj_player{
		if (facing % 3)==dir and !place_meeting(x,y,obj_sidestair)
			y+=1+(2*(facing>6));
	}
}

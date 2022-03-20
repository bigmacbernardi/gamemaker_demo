/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if ((--countdown)<=0){
	countdown=100+irandom(50);
	var target_x=xyxy[state*2];//x instead?
	var target_y=xyxy[state*2+1];//
	if ++state>=phases
		state=0;
	var x_gap = xyxy[state*2]-target_x;
	var y_gap = xyxy[state*2+1]-target_y;
	if (x_gap==0 and y_gap==0){
		image_speed=0;
		image_index=0;
	}
	else{
		image_speed=1;
		if abs(x_gap) > abs(y_gap){
			sprite_index=kidside;
			if x_gap>0{//go right
				image_xscale=1;
			}else{
				image_xscale=-1;
			}
		}
		else{
			if y_gap<0{//go up
				sprite_index=kidback;
			}else{
				sprite_index=kidfront;
			}
		}
	}
	x_inc=x_gap/countdown;
	y_inc=y_gap/countdown;
}
else{
	x+=x_inc;
	y+=y_inc;
}
event_inherited();


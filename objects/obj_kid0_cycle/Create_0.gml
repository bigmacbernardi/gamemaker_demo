/// @description Insert description here
myinteract= 3;
//facing = 2;
//depth = -y;
mydialoguer=noone;
state = 0;
x_inc = 0;
y_inc = 0;
countdown=0;
if relativeToOrigin{
	for (var i=0;i<array_length(xyxy);i++){
		xyxy[i]+=(i%2?y:x);	
	}
}
phases=array_length(xyxy)/2;
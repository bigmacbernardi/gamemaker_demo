/// @description When created, this box will print a globally selected line character by character.
// The entire line will display at once
//stopping movement
obj_player.paused = true;
//Toby's variables
writingx= 0;
writingy= 0;
SCR_TEXTTYPE(global.typer); //sets text properties
x= round(x);
y= round(y);
doak= 0;
stringno= 0;
stringpos= 1;
lineno= 0;
halt= 0;
writingx= round(writingx);
writingy= round(writingy);
myx= writingx;
myy= writingy;
script_execute(SCR_TEXT, global.lineNo);
n= 0;
while(global.msg[n] != "%%%") { //Toby's method for indicating a line is complete.  Unnecessary for our purposes, but still implemented for the sake of ripping his code at this stage.
    mystring[n]= global.msg[n];
    n++;
}
originalstring= mystring[0];
dfy= 0;
alarm[0]= textspeed;

/*for (var i = 0; i < string_length(line);i++){
	
	if (sound != noone)	audio_play_sound(sound, 8, false);
}*/

lastMsc = -1;
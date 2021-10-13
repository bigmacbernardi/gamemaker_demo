/// @description When created, this box will print a globally selected line character by character.
// The entire line will display at once
//Toby's variables
writingx= 0;
writingy= 0;
SCR_TEXTTYPE(global.typer); //idk what this does
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
show_debug_message("at exectuion time: msc was gonna be "+string(global.msc));
show_debug_message("fixing it to zero like an asshole");
global.msc = 0;
script_execute(SCR_TEXT, global.msc);
n= 0;
while(global.msg[n] != "%%%") {
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
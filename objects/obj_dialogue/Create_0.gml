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

//My variables
speaker = dialog[global.dialogueLine][0];
expr = dialog[global.dialogueLine][1];
line = dialog[global.dialogueLine][2];
advance = dialog[global.dialogueLine][3];
sprite = noone;
sound = noone;
if (speaker==0){ //narrator/minor char
	//sprite = noone;
}
else if (speaker == 1){

}
else if (speaker == 3){
	var faces = [spr_elder_face0,spr_elder_face0,spr_elder_face2];
	sprite = faces[expr];
}
/*for (var i = 0; i < string_length(line);i++){
	
	if (sound != noone)	audio_play_sound(sound, 8, false);
}*/
/// @description Remnant of earlier system
// You can write your code in this editor


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
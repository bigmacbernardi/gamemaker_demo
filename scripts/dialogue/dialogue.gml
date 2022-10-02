// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/* format is 
[CHARACTER, EXPRESSION, LINE, DOES IT CONTINUE? (true/false)]

CHARACTERS:  0 = No one/Narrator, 1 = Musa, 2 = Mori, 3 = Elder, 4 = Andolphus, 5 = Musa Mom, 6 = Mori Mom ...
EXPRESSIONS: 0 = Neutral/Calm, 1 = Serious, 2 = Happy, 3 = Sad, 4 = Afraid, 5 = Angry, 6 = Laughing
             7 = Confused, 8 = Shocked, 9 = Disgusted, 10 = Tired/Annoyed, 11 = Smug, 12 = Horny/other
             Obviously not every character needs all these expressions.
LINES:       Include {speed,pitch(default=0)} to modulate speech
*/

dialog = [
    [0,0,"Welcome to METROPOLE",false],	//Line 0
    [0,2,"We're gonna do a thing",true],	//Line 1
    [2,0,"True",true],	//Line 2
	[1,2,"And I'm here too!",true],	//Line 3
	[1,2,"Where?",false]	//Line 4
];
function dialogue(){
	show_debug_message(dialog.length > 0 ? "Dialogue loaded?" : "No dialogue, eh?");
}
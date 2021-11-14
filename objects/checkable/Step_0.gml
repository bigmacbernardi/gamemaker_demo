/// @description Some absolute nonsense
// You can write your code in this editor
if(myinteract == 1) {
    global.interact= 1;
    alarm[0]= 1;//followup action
    myinteract= 2;
}
if(myinteract == 3 && (mydialoguer!=noone)) {
    global.interact= 0;
    myinteract= 0;
}
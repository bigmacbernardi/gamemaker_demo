/// @description Some absolute nonsense
// You can write your code in this editor
if(myinteract == 1) {
    global.interact= 1;//may use for conflict resoluton at some point
    alarm[0]= 1;//followup action; not even using!
    myinteract= 2;
}
if(myinteract == 3 && (mydialoguer!=noone)) {//reset
    global.interact= 0;
    myinteract= 0;
}
depth=-y;
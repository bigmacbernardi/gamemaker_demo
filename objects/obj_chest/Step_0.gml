/// @description Who knows what this used to do
//Still sets unnecessary alarm too, i'll comment that out
if(myinteract == 1) {
    global.interact= 1;
    alarm[0]= 1;
    myinteract= 2;
}
if(myinteract == 3){// && !instance_exists(mydialoguer)) { //mydialoguer not needed
    global.interact= 0;
    myinteract= 0;
}
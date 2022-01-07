/// @description Insert description here
if(halt == 1) {
    myletter= " ";
    stringpos= 1;
    stringno++;//stringno = min(stringno+1,array_length(mystring)-1);
    currentLine= global.msg[stringno];//once used mystring
    myx= writingx;
    myy= writingy;
    lineno= 0;
    halt= 0;
    alarm[0]= textspeed;
}
if(halt == 2) instance_destroy();
if(halt == 4) {//guessing it's the start of the fight
//    global.myfight= 0;
//    global.mnfight= 1;
    keyboard_clear(13/* ENTER */);
    instance_destroy();
}
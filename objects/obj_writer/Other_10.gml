/// @description Insert description here
if(halt == 1) {
    myletter= " ";
    stringpos= 1;
    stringno++;//stringno = min(stringno+1,array_length_1d(mystring)-1);
    originalstring= mystring[stringno];
    myx= writingx;
    myy= writingy;
    lineno= 0;
    halt= 0;
    alarm[0]= textspeed;
}
if(halt == 2) instance_destroy();
if(halt == 4) {
    global.myfight= 0;
    global.mnfight= 1;
    keyboard_clear(13/* ENTER */);
    instance_destroy();
}
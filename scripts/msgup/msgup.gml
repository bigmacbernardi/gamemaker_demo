// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if variable_global_exists("msc") global.msc++;
else global.msc = 0;
if !variable_global_exists("msg") global.msg=["Bub","%%%","%%%","%%%"]; 
writingx=0;
writingy=0;
stringno= 0;
stringpos= 1;
lineno= 0;
writingx= round(writingx);
writingy= round(writingy);
myx= writingx;
myy= writingy;
script_execute(SCR_TEXT, global.msc);
n= 0;
while(global.msg[n] != "%%%") {
    mystring[n]= global.msg[n];
    n++;
}
originalstring= mystring[0];
halt= 0;
alarm[0]= textspeed;
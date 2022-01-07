// Toby script asset.  Used to advance the dialoguer to the next line.
show_debug_message("Running msgup");
if variable_global_exists("msc") global.lineNo++;
else global.lineNo = 0;
if !variable_global_exists("msg") global.msg=["Global msg","had to be","created.","%%%"]; 
with obj_choose{
	writingx=0;
	writingy=0;
	stringno = 0;
	stringpos=1;
	lineno = 0;
	writingx= round(writingx);
	writingy= round(writingy);
	myx= writingx;
	myy= writingy;
	script_execute(SCR_TEXT, global.lineNo);
	n= 0;
	while(global.msg[n] != "%%%") {
	    mystring[n]= global.msg[n];
	    n++;
	}
	currentLine = mystring[0];
	halt= 0;
	alarm[0]= textspeed;
}
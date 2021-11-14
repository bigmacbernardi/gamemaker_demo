// Taken from Toby
switch(argument0){
	case 0: 
        global.msg[0]= "\\XLa, la.^3 &Welcome to METROPOLE&up and\\R smell\\X &the^4 pain./";
        global.msg[1]= "* Though^2.^4.^6.^8.&It\'s still a&little shaky./";
        global.msg[2]= "fhuehfuehfuehfuheufhe/%";
        global.msg[3]= "%%%";
        break;
	case 1: 
        global.msg[0]= "* Binky./";
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 2: 
        global.msg[0]= "* Sign line 1./";
        global.msg[1]= "PUNCHLINE!/";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 3: 
        global.msg[0]= "Haha I just kidding,&I fix it./";
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	default: 
        var playerNames = ["Aoi","Yusuf"];
        if (variable_global_exists("currentParty")) global.msg[0]= "* Hey "+playerNames[global.currentParty[0]]+"./";
        else  global.msg[0]= "* Hey kid./";
		global.msg[1]= "I'm over here. &But don't come talk to me,&or the game will break./%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
}


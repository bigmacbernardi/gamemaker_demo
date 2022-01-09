// Taken from Toby
switch(argument0){
	case 0: 
        global.msg[0]= "La la.^3 Welcome2METROPOLE&up and\\R smell\\X the^4 pain./";
        global.msg[1]= "* Though^2.^4.^6.^8.&It\'s still a ^4little shaky./";
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
        global.msg[0]= "Hold SHIFT to run.&Hold CTRL to slow down.&Hold V for debug view./";
        global.msg[1]= "       ..."+global.names[global.currentParty[0]]+"./";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 3:
        global.msg[0]= "Haha I just kidding,&I fix it./";
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 25: 
		global.msg = ["Just gotta keep going north.","%%%"];
		break;
	case 26:
		global.msg = [" Looks like the path up here's& collapsed./",
		" This place is huge^2.& There's probably another safe way& down./",
		"%%%"];
		break;
	case 27:
		global.msg = [" Why are we going this way?/","%%%"];
		break;
	case 28:
		global.msg = [" Just looking around for something& that could help./",
		"%%%"];
		break;
	case 29.0:
		global.msg = ["The path to the second staircase was&collapsed./","%%%"];
		break;
	case 29.1:
		global.msg = ["You should try going through the library./",
		"That wing's a lot newer, and there's&another staircase there.",
		"%%%"];
		break;
	case 29.2:
		global.msg = ["We went down through the library,",
		"but the path to the third staircase was&collapsed./",
		"%%%"];
		break;
	case 29.3:
		global.msg = ["Go figure it out, then!  You're being&graded on this.",
		"%%%"];
		break;
	case 30:
        global.msg[0]= "Bichael Mackson/";
        global.msg[1]= "Not that you would know./";
        global.msg[2]= "The parts for by dialogue aren't finished&yet./";
        global.msg[3]= "And that's why I have this ridiculous &placeholder dialogue./";
        global.msg[4]= "%%%";
        break;
	case 31:
        global.msg[0]= " I read bo^1o^1o^1o^1o^1ks/";
        global.msg[1]= "That's why by thoughts are so complex!/";
        global.msg[2]= "I'b such a cultured figure that to truly&even engage with bee requires all sorts of &conversation options not even developed yet./";
        global.msg[3]= "I bean^4, by god^3!&Forget player choices, what if I had bore&than 4 text boxes of dialogue to share??/";
        global.msg[4]= "Ok, baybe that's not such a problem.&Thank god for dynabizzub./";
        global.msg[5]= "%%%";
        break;
	case 32:
        global.msg[0]= "I'm what, according to &these books, your people/";
        global.msg[1]= "call a 'bitch-ass.^5'%";
        global.msg[2]= "Boo^1oo%";
        global.msg[3]= "%%%";
        global.msg[4]= "%%%";
        global.msg[5]= "%%%";
        break;
	/*chest messages*/
	case 1000:
        global.msg[0]= " Got an Old Helm!/";//maybe make this read the name of last item received
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 1001:
        global.msg[0]= "Got Vegetable Soup!/";
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	default: 
        //var playerNames = ["Aoi","Yusuf"];
        if (variable_global_exists("currentParty")) global.msg[0]= "* Hey "+global.names[global.currentParty[0]]+"./";
        else  global.msg[0]= "* Hey kid./";
		global.msg[1]= "I'm over here. &But don't come talk to me,&or the game will break./%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
}


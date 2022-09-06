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
        global.msg[1]= "And most importantly, F8 for the Dev Menu, "+global.names[global.currentParty[0]]+"!/";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 3:
        global.msg[0]= "Haha I just kidding,&I fix it./";
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 4:
		global.msg = ["What is this thing?/","%%%"];
		break;
	case 5:
		global.msg = ["Who knows, let's keep going./","%%%"];
		break;
	case 6:
		break;
	case 7:
		break;
	
	case 8://mirror text
		if global.currentParty[0]==YUSUF{
			global.msg = ["Wow!{1}&What a handsome young man!^3 :)/","%%%"]; 
		}
		else if  global.currentParty[0]==AOI{
				global.msg = ["You look fine./","%%%"];
		}
		else global.msg = ["A mirror./","%%%"];
		break;
	case 9://dresser message
		global.msg = ["The drawers are filled with wadded-up &shirts./",(global.currentParty[0]==YUSUF?"You think":global.names[YUSUF]+" thinks")+" that folding takes up &too much time./","%%%"];
		break;
	case 10:
		global.msg = [" Hm... lots of rubble around here.{0}& We should watch our step./","%%%"]
		break;
	case 11: 
		global.msg = ["{6} Where is it???/",
		"%%%"];
		break;

	case 12: 
		global.msg = ["{6}"+global.names[YUSUF]+"!!/",
		"%%%"];
		break;

	case 13: 
		global.msg = ["{5} Just a second!/",
		"%%%"];
		break;
	case 14: global.msg = ["{4}Did you lose your bag again?/",
		"%%%"];
		break;
	case 15:
		global.msg = ["{4} I’ll be right out!/",
		"%%%"];
		break;
	case 16:
		global.msg = ["yuo know u need to see elder/","About… ^7&…Ashfall?/",
		"%%%"];
		break;
	case 17:
           global.msg = ["mom i’m leaving/", "go take a shit or & something/",
		"%%%"];
		break;
	case 18: global.msg = ["get serious dialogue you&lazy ass fuck/","%%%"];
         break;
	case 25: 
		global.msg = ["Just gotta keep going north.","%%%"];
		break;
	case 26:
		global.msg = [" Looks like the path up here's& collapsed^3.{1}/",
		"{0} This place is huge^2.& There's {7}probably {0}another safe way& down./",
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
        global.msg[0]= "Hello!  Not often we get visitors./";
        global.msg[1]= "What brings you here?/";
        global.msg[2]= "The parts for by dialogue aren't finished&yet./";
        global.msg[3]= "And that's why I have this ridiculous &placeholder dialogue./";
        global.msg[4]= "%%%";
        break;
	case 31:
		global.nameplate = "Bichael";
        global.msg[0]= " I read bo^1o^1o^1o^1o^1ks/";
        global.msg[1]= "A lot of these books were eaten through,/";
        global.msg[2]= "but for some reason I can still read the parts where the pages are gone./";
        global.msg[3]= "I bean^4, by god^3!&Forget player choices, what if I had bore&than 4 text boxes of dialogue to share??/";
        global.msg[4]= "Ok, baybe that's not such a problem.&Thank god for dynabizzub./";
        global.msg[5]= "%%%";
        break;
	case 32:
		global.nameplate = "Bichael";
        global.msg[0]= "I'm what, according to &these books, your people/";
        global.msg[1]= "call a 'bitch-ass.^5'%";
        global.msg[2]= "Boo^1oo%";
        global.msg[3]= "%%%";
        global.msg[4]= "%%%";
        global.msg[5]= "%%%";
        break;
	case 33:
		global.facechoice = global.currentParty[0]+2;
		global.faceemotion = 2;
		global.nameplate = global.currentParty[0]==YUSUF?"Yousuf":"You";
		global.msg =["        Happy ghost!/","%%%"];
		break;
	case 34:
		global.msg =["Sad ghost./","%%%"];
		break;
	case 35:
		global.msg =["Oh, they're not my friends./","%%%"];
		break;
	case 36:
		global.msg =["They're not my friends^5. &Asshole^1.%","%%%"];
		break;
	case 37:
		global.msg =["The parts for by dialogue aren't finished&yet./",
			"And that's why I have this ridiculous &placeholder dialogue./","%%%"];
		break;
		
	//DUNGEON 1 NOTES: After changing font, maybe “ and ” will work again
	case 40:
		global.msg=["A note is written:/","'We excavated some old tools and weapons.&Worthless now, but maybe we can test on&them.'/",
		"%%%"];
		break;
	case 41:
		global.msg=["A note:/","'According to the documents we've recovered,&these were used by past inhabitants to&control the weather.'/",
		"'No use or interest to us at this time.'/","%%%"];
		break;
	case 42:
		global.msg=["A note:/","'Aw sweet, rocks!  Now we're talkin''/",
		"%%%"];
		break;
	case 43:
		global.msg=["A partially legible log is written out:/","'[...] (unreadable)&Finally, we're seeing results. Applying the&[...] the sword to move, but only...'/",
		"'...in one direction.&It inevitably ends up trapped in a corner.'/","%%%"];
		break;
	case 44:
		global.msg=["A note:/","'Day 93: Testing has bore unexpected fruit&in a practical application.  The hammer's&reliable movement has proven useful for...'/",
		"'...tempering our current equipment.& &We don't yet know how to stop it.'/","%%%"];
		break;
	
	case 200:
		global.msg =["Give shooting a shot!/","Pew pew pew! ^4 Pew pew pew pew pew!/",
				"Get 10 points to get the most points &you can get!/","%%%"];
		break;
	case 201:
		global.msg =["Last time, you got "+string(obj_attendant.lastPoints)+" points./",
			"The best you've ever done is "+string(global.shootHiScore)+" points./","%%%"];
		break;
	/*chest messages*/
	case 1000:
        global.msg[0]= " Got an Old Helm!/";//maybe make this read the name of last item received
        global.msg[1]= "%%%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
	case 1001:
		global.msg= ["Got Potion!/","%%%"];
        break;
	case 1002:
	case 1003:
        global.msg= ["Got Vegetable Soup!/","%%%"];
        break;
	case 1005:
		global.msg= ["Found an Ether./","%%%"];
        break;
	case 1010:
		global.msg= ["Got a Halite Ring!/","%%%"];
        break;
	default: 
        //var playerNames = ["Aoi","Yusuf"];
        if (variable_global_exists("currentParty")) global.msg[0]= "* Hey "+global.names[global.currentParty[0]]+"./";
        else  global.msg[0]= "* Hey kid./";
		global.msg[1]= "I'm over here. &But don't come talk to me,&or the {2}game will break./%";
        global.msg[2]= "%%%";
        global.msg[3]= "%%%";
        break;
}


/// @description Insert description here
myx= writingx;
myy= writingy;
n= 1;
while(n < stringpos + 1) {
    nskip= 0;
    if(string_char_at(currentLine, n) == "{") {//line break!
        var next = "";
		n++;
		while string_char_at(currentLine,n)!="}"{
			next += string_char_at(currentLine,n);
			n++;
		}
		if next !=""{
			var num = real(next);
			if global.faceemotion!=num{
				global.faceemotion=num;
				global.facechange=1;
				instance_destroy(obj_face);
				with obj_dialoguer
					scr_facechoice(num);
			}
		}
		n++;
    }
    if(string_char_at(currentLine, n) == "&") {//line break!
        myx= writingx;
		myy+= vspacing;
		lineno++;
        n++;
    }
    if(string_char_at(currentLine, n) == "^") {
        if(string_char_at(currentLine, n + 1) == "0") nskip= 1;
        else  n+= 2;
    }
    if(string_char_at(currentLine, n) == "\\" + chr(ord("\""))+ " + ") {
        if(string_char_at(currentLine, n + 1) == "R")
            mycolor= 255;
        else if(string_char_at(currentLine, n + 1) == "G")
            mycolor= 65280;
        else if(string_char_at(currentLine, n + 1) == "W")
            mycolor= 16777215;
        else if(string_char_at(currentLine, n + 1) == "Y")
            mycolor= 65535;
        else if(string_char_at(currentLine, n + 1) == "X")
            mycolor= 0;
        else if(string_char_at(currentLine, n + 1) == "B")
            mycolor= 16711680;
        else if(string_char_at(currentLine, n + 1) == "O")
            mycolor= 4235519;
        else if(string_char_at(currentLine, n + 1) == "L")
            mycolor= 16754964;
        else if(string_char_at(currentLine, n + 1) == "P")
            mycolor= 16711935;
        else if(string_char_at(currentLine, n + 1) == "p")
            mycolor= 13941759;
        else if(string_char_at(currentLine, n + 1) == "C" && global.inbattle == 0) {
            if(!instance_exists(obj_choose)) {
                //SAVE FOR LATER
				choicer = instance_create_depth(0, 0,-20,obj_choose);
				choicer.creator= id;
				halt= 5;
			}
        }
        if(string_char_at(currentLine, n + 1) == "M") {
            global.flag[20]= real(string_char_at(currentLine, n + 2));
            n++;
        }
        if(string_char_at(currentLine, n + 1) == "E") {
            global.faceemotion= real(string_char_at(currentLine, n + 2));
            n++;
        }
        if(string_char_at(currentLine, n + 1) == "F") {
            global.facechoice= real(string_char_at(currentLine, n + 2));
            global.facechange= 1;
            n++;
        }
        if(string_char_at(currentLine, n + 1) == "T") {
            newtyper= string_char_at(currentLine, n + 2);
            if(newtyper == "T") global.typer= 4;
            else if(newtyper == "t") global.typer= 48;
            else if(newtyper == "0") global.typer= 5;
            else if(newtyper == "S") global.typer= 10;
            else if(newtyper == "F") global.typer= 16;
            else if(newtyper == "s") global.typer= 17;
            else if(newtyper == "P") global.typer= 18;
            else if(newtyper == "M") global.typer= 27;
            else if(newtyper == "U") global.typer= 37;
            else if(newtyper == "A") global.typer= 47;
            else if(newtyper == "a") global.typer= 60;
            else if(newtyper == "R") global.typer= 76;
            script_execute(SCR_TEXTTYPE, global.typer);
            global.facechange= 1;
            n++;
        }
        if(string_char_at(currentLine, n + 1) == "z") {
            sym= real(string_char_at(currentLine, n + 2));
            sym_s= 837;
            if(sym == 4) sym_s= 837;
            if(sym == 4) //wtf?
                draw_sprite_ext(sym_s, 0, myx + random(shake) - shake / 2, myy + 10 + random(shake) - shake / 2, 2, 2, 0, 16777215, 1);
            n++;
        }
        n+= 2;
    }
    if(string_char_at(currentLine, n) == "/") {
        halt= 1;
        if(string_char_at(currentLine, n + 1) == "%") halt= 2;
        if(string_char_at(currentLine, n + 1) == "^" && string_char_at(currentLine, n + 2) != "0")
            halt= 4;
        if(string_char_at(currentLine, n + 1) == "*") halt= 6;
        break;
    } else  {
        if(string_char_at(currentLine, n) == "%") {
            if(string_char_at(currentLine, n + 1) == "%") {
				show_debug_message("DOUBLE % SPOTTED");//used to confirm it wasn't getting this far
                instance_destroy();
                break;
            } else  {
				show_debug_message("SINGLE % SPOTTED");
                stringpos= 1;
                stringno++;//stringno = min(stringno+1,array_length(mystring)-1);
                currentLine= global.msg[stringno]; //once used myString
                myx= writingx;
                myy= writingy;
                lineno= 0;
                alarm[0]= textspeed;
                myletter= " ";
                break;
            }
        } else  {
            if(myx > writingxend) {
				myx= writingx;
				myy+= vspacing;
				lineno++;	
			}
            myletter= string_char_at(currentLine, n);
            if(global.typer == 18) {
                if(myletter == "l" || myletter == "i") myx+= 2;
                if(myletter == "I") myx+= 2;
                if(myletter == "!") myx+= 2;
                if(myletter == ".") myx+= 2;
                if(myletter == "S") myx++;
                if(myletter == "?") myx+= 2;
                if(myletter == "D") myx++;
                if(myletter == "A") myx++;
                if(myletter == "\'") myx++;
            }
            draw_set_font(myfont);
            draw_set_color(mycolor);
            if(shake > 38) {
                if(shake == 39) {
                    direction+= 10;
                    draw_text(myx + hspeed, myy + vspeed, myletter);
                }
                if(shake == 40)
                    draw_text(myx + hspeed, myy + vspeed, myletter);
                if(shake == 41) {
                    direction+= 10 * n;
                    draw_text(myx + hspeed, myy + vspeed, myletter);
                    direction-= 10 * n;
                }
                if(shake == 42) {
                    direction+= 20 * n;
                    draw_text(myx + hspeed, myy + vspeed, myletter);
                    direction-= 20 * n;
                }
                if(shake == 43) {
                    direction+= 30 * n;
                    draw_text(myx + hspeed * 0.7 + 10, myy + vspeed * 0.7, myletter);
                    direction-= 30 * n;
                }
            } else 
                draw_text(myx + random(shake) - shake / 2, myy + random(shake) - shake / 2, myletter);
            myx+= spacing;
            if(myfont == 8) {
                if(myletter == "w") myx+= 2;
                if(myletter == "m") myx+= 2;
                if(myletter == "i") myx-= 2;
                if(myletter == "l") myx-= 2;
                if(myletter == "s") myx--;
                if(myletter == "j") myx--;
            }
            if(myfont == 9) {
                if(myletter == "D") myx++;
                if(myletter == "Q") myx+= 3;
                if(myletter == "M") myx++;
                if(myletter == "L") myx--;
                if(myletter == "K") myx--;
                if(myletter == "C") myx++;
                if(myletter == ".") myx-= 3;
                if(myletter == "!") myx-= 3;
                if(myletter == "O" || myletter == "W") myx+= 2;
                if(myletter == "I") myx-= 6;
                if(myletter == "T") myx--;
                if(myletter == "P") myx-= 2;
                if(myletter == "R") myx-= 2;
                if(myletter == "A") myx++;
                if(myletter == "H") myx++;
                if(myletter == "B") myx++;
                if(myletter == "G") myx++;
                if(myletter == "F") myx--;
                if(myletter == "?") myx-= 3;
                if(myletter == "\'") myx-= 6;
                if(myletter == "J") myx--;
            }
            n+= nskip;
            n++;
        }
    }
}
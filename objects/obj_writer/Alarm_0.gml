/// @description Idk what this code means, but it's the event type in Toby's

if(stringpos < string_length(originalstring)) {
    stringpos++;
    if(global.typer == 111) stringpos++;
    alarm[0]= textspeed;
    if(string_char_at(originalstring, stringpos) == "^" && string_char_at(originalstring, stringpos + 1) != "0") {
        n= real(string_char_at(originalstring, stringpos + 1));
        alarm[0]= n * 10;
    } else  {
        if(txtsound == 56 || txtsound == 65 || txtsound == 71) {
            if(txtsound == 56) {
                if(string_char_at(originalstring, stringpos) != "" && string_char_at(originalstring, stringpos) != "^" && string_char_at(originalstring, stringpos) != "/" && string_char_at(originalstring, stringpos) != "%") {
                    //snd_stop(56);
                    //snd_stop(57);
                    //snd_stop(58);
                    //snd_stop(59);
                    //snd_stop(60);
                    //snd_stop(61);
                    //snd_stop(62);
                    //snd_stop(63);
                    //snd_stop(64);
                    rnsound= floor(random(9));
                    switch(rnsound) {
                        case 8:
                            //snd_play(56/* //snd_mtt1 */);
                            break;
                        case 7:
                            //snd_play(57/* //snd_mtt2 */);
                            break;
                        case 6:
                            //snd_play(58/* //snd_mtt3 */);
                            break;
                        case 5:
                            //snd_play(59/* //snd_mtt4 */);
                            break;
                        case 4:
                            //snd_play(60/* //snd_mtt5 */);
                            break;
                        case 3:
                            //snd_play(61/* //snd_mtt6 */);
                            break;
                        case 2:
                            //snd_play(62/* //snd_mtt7 */);
                            break;
                        case 1:
                            //snd_play(63/* //snd_mtt8 */);
                            break;
                        case 0:
                            //snd_play(64/* //snd_mtt9 */);
                            break;
                    }
                }
                stringpos+= 2;
            }
            if(txtsound == 71 && string_char_at(originalstring, stringpos) != "" && string_char_at(originalstring, stringpos) != "^" && string_char_at(originalstring, stringpos) != "/" && string_char_at(originalstring, stringpos) != "%") {
                //snd_stop(71);
                //snd_stop(72);
                //snd_stop(73);
                //snd_stop(74);
                //snd_stop(75);
                //snd_stop(76);
                //snd_stop(77);
                rnsound= floor(random(7));
                switch(rnsound) {
                    case 6:
                        //snd_play(71/* //snd_wngdng1 */);
                        break;
                    case 5:
                        //snd_play(72/* //snd_wngdng2 */);
                        break;
                    case 4:
                        //snd_play(73/* //snd_wngdng3 */);
                        break;
                    case 3:
                        //snd_play(74/* //snd_wngdng4 */);
                        break;
                    case 2:
                        //snd_play(75/* //snd_wngdng5 */);
                        break;
                    case 1:
                        //snd_play(76/* //snd_wngdng6 */);
                        break;
                    case 0:
                        //snd_play(77/* //snd_wngdng7 */);
                        break;
                }
            }
            if(txtsound == 65) {
                if(string_char_at(originalstring, stringpos) != "" && string_char_at(originalstring, stringpos) != "^" && string_char_at(originalstring, stringpos) != "/" && string_char_at(originalstring, stringpos) != "%") {
                    //snd_stop(65);
                    //snd_stop(66);
                    //snd_stop(67);
                    //snd_stop(68);
                    //snd_stop(69);
                    //snd_stop(70);
                    rnsound= floor(random(6));
                    switch(rnsound) {
                        case 5:
                            //snd_play(65/* //snd_tem */);
                            break;
                        case 4:
                            //snd_play(66/* //snd_tem2 */);
                            break;
                        case 3:
                            //snd_play(67/* //snd_tem3 */);
                            break;
                        case 2:
                            //snd_play(68/* //snd_tem4 */);
                            break;
                        case 1:
                            //snd_play(69/* //snd_tem5 */);
                            break;
                        case 0:
                            //snd_play(70/* //snd_tem6 */);
                            break;
                    }
                }
                stringpos++;
            }
        } else  {
            if (string_char_at(originalstring, stringpos) != "" && 
				string_char_at(originalstring, stringpos) != " " && 
				string_char_at(originalstring, stringpos) != "&" && 
				string_char_at(originalstring, stringpos) != "^" && 
				string_char_at(originalstring, stringpos - 1) != "^" && 
				string_char_at(originalstring, stringpos) != "\\" + chr(ord("\"")) && 
				string_char_at(originalstring, stringpos - 1) != "\\" + chr(ord("\"")) && 
				string_char_at(originalstring, stringpos) != "/" && string_char_at(originalstring, stringpos) != "%") {
                //snd_stop(txtsound);
                //snd_play(txtsound);
            }
        }
    }
    if(string_char_at(originalstring, stringpos) == "&")
        stringpos++;
    if(string_char_at(originalstring, stringpos) ==  "\\" + chr(ord("\""))+ " + ")
        stringpos+= 2;
}
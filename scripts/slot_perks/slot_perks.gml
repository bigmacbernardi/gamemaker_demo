// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkForPerks(char,stat,oldval,newval){
	if char == MORI{
		switch(stat){
			case DEF: if oldval<10 && newval>=10{
						//gain Mori def perk	
					  }break;
			case SPD: if oldval<25 && newval>=25{
						//gain Mori spd perk	
					  }break;
			case STR: if oldval<10 && newval>=10{
						//gain Mori STR perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Mori STR perk 2
					  }
					  if oldval<60 && newval>=60{
						  global.passives[MORI][16]+=6;	//gain Mori STR perk 3if instance_exists(battle_manager){
						  
						  if instance_exists(battle_manager) with battle_manager{
							var strong = global.names[MORI] + " gained Double Attack!";
							ds_list_add(futureMessages,strong);
						  }
					  }
					  if oldval<80 && newval>=80{	  
						//gain Mori STR perk 3
					  }
					  break;
			case AGI: if oldval<35 && newval>=35{
						//gain Mori AGI perk	
					  }break;
			case CHA: if oldval<55 && newval>=55{
						//gain Mori CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if oldval<4 && newval>=4{
						//gain Mori DEX perk 1
						global.passives[MORI][0]+=5;
						if instance_exists(battle_manager){
							with battle_manager{
								var strong = global.names[MORI] + " learned Scan (Lv 1)!";
								ds_list_add(futureMessages,strong);
							}
						}
						else{
							audio_play_sound(Notice1,100,0);	
						}
					  }
					  if oldval<30 && newval>=30{	  
						//gain Mori DEX perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Mori DEX perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Mori DEX perk 3
					  }
					  break;
			case WIS: if oldval<10 && newval>=10{
						//gain Mori WIS perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Mori WIS perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Mori WIS perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Mori WIS perk 3
					  }
					  break;
			
		}
	}else if char==MUSA{
		switch(stat){//ONLY UP-TO_DATE NUMBER IS AGI
			case DEF: if oldval<10 && newval>=10{
						//gain Musa def perk	
					  }break;
			case SPD: if oldval<25 && newval>=25{
						//gain Musa spd perk	
					  }break;
			case STR: if oldval<10 && newval>=10{
						//gain Musa STR perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Musa STR perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Musa STR perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Musa STR perk 3
					  }
					  break;
			case AGI: if oldval<7 && newval>=7{
						global.skills[MUSA][4]=true;
						if instance_exists(battle_manager){
							with battle_manager{
								var strong = global.names[MUSA] + " learned Cure Poison!";
								ds_list_add(futureMessages,strong);
							}
						}
						else{
							audio_play_sound(Notice1,100,0);	
						}
					  }break;
			case CHA: if oldval<55 && newval>=55{
						//gain Musa CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if oldval<10 && newval>=10{
						//gain Musa DEX perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Musa DEX perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Musa DEX perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Musa DEX perk 3
					  }
					  break;
			case WIS: if oldval<10 && newval>=10{
						//gain Musa WIS perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Musa WIS perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Musa WIS perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Musa WIS perk 3
					  }
					  break;
			
		}
	}
}

function checkForPerkLoss(char,stat,oldval,newval){
	if char == MORI{
		switch(stat){
			case DEF: if newval<10 && oldval>=10{
						//lose Mori def perk	
					  }break;
			case SPD: if newval<25 && oldval>=25{
						//lose Mori spd perk	
					  }break;
			case STR: if newval<10 && oldval>=10{
						//lose Mori STR perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Mori STR perk 2
					  }
					  if newval<60 && oldval>=60{
						  global.passives[MORI][16]-=6;
						//lose Mori STR perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Mori STR perk 3
					  }
					  break;
			case AGI: if newval<35 && oldval>=35{
						//lose Mori AGI perk	
					  }break;
			case CHA: if newval<55 && oldval>=55{
						//lose Mori CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if newval<4 && oldval>=4{
						//lose Mori DEX perk 1
						global.passives[MORI][0]-=5;
						audio_play_sound(MeanyHit4,100,0);	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Mori DEX perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//lose Mori DEX perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Mori DEX perk 3
					  }
					  break;
			case WIS: if newval<10 && oldval>=10{
						//lose Mori WIS perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Mori WIS perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//lose Mori WIS perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Mori WIS perk 3
					  }
					  break;
			
		}
	}
	else if char==MUSA{
		switch(stat){//ONLY UP-TO_DATE NUMBER IS AGI
			case DEF: if newval<10 && oldval>=10{
						//lose Musa def perk	
					  }break;
			case SPD: if newval<25 && oldval>=25{
						//lose Musa spd perk	
					  }break;
			case STR: if newval<10 && oldval>=10{
						//lose Musa STR perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Musa STR perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//lose Musa STR perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Musa STR perk 3
					  }
					  break;
			case AGI: if newval<7 && oldval>=7{
						global.skills[MUSA][4]=false;
						audio_play_sound(MeanyHit4,100,0);
					  }break;
			case CHA: if newval<55 && oldval>=55{
						//lose Musa CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if newval<10 && oldval>=10{
						//lose Musa DEX perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Musa DEX perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//lose Musa DEX perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Musa DEX perk 3
					  }
					  break;
			case WIS: if newval<10 && oldval>=10{
						//lose Musa WIS perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//lose Musa WIS perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//lose Musa WIS perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//lose Musa WIS perk 3
					  }
					  break;
			}
	}
}

function slot_perks(charIndex){
	var arr = [[//stat,minRequired,title,description
		[DEF,10,"",""],
		[STR,10,"",""],
		[DEX,4,"Unlock Scan","See the truth (enemy HP)\nCan be powered up."],
		[WIS,15,"",""],
		[SPD,25,"",""],
		[STR,30,"",""],
		[AGI,24,"Unlock Foresight","Increase your whole squad's likelihood to \n dodge any attack.  Can be powered up."],
		[WIS,40,"",""],
		[DEF,55,"",""],
		[STR,60,"Double-Attack","When single-wielding, all physical attacks\n are doubled."],
		[CHA,51,"",""],
		[WIS,60,"",""],
		[DEF,80,"",""],
		[STR,80,"",""],
		[DEX,80,"",""],
		[WIS,80,"",""]
	],[
		[DEF,10,"",""],
		[AGI,7,"New skill: Cure Poison","Unlock 'Cure Poison' skill"],
		[CHA,15,"",""],
		[DEX,10,"",""],
		[SPD,25,"",""],
		[STR,30,"",""],
		[CHA,35,"",""],
		[WIS,40,"",""],
		[DEF,60,"Resiliance","Take less damage from Poison, Ice,\n and Earth attacks."],
		[STR,65,"",""],
		[CHA,55,"",""],
		[WIS,60,"",""],
		[DEF,80,"",""],
		[SPD,80,"",""],
		[CHA,80,"",""],
		[DEX,80,"Sleight-of-Hand","Chance to steal ultra-rare items from\n certain enemies."]
	]];
	return arr[charIndex];
}
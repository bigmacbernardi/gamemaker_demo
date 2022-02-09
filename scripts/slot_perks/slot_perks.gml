// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkForPerks(char,stat,oldval,newval){
	if char == AOI{
		switch(stat){
			case DEF: if oldval<10 && newval>=10{
						//gain Aoi def perk	
					  }break;
			case SPD: if oldval<25 && newval>=25{
						//gain Aoi spd perk	
					  }break;
			case STR: if oldval<10 && newval>=10{
						//gain Aoi STR perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Aoi STR perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Aoi STR perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Aoi STR perk 3
					  }
					  break;
			case AGI: if oldval<35 && newval>=35{
						//gain Aoi AGI perk	
					  }break;
			case CHA: if oldval<55 && newval>=55{
						//gain Aoi CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if oldval<10 && newval>=10{
						//gain Aoi DEX perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Aoi DEX perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Aoi DEX perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Aoi DEX perk 3
					  }
					  break;
			case WIS: if oldval<10 && newval>=10{
						//gain Aoi WIS perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Aoi WIS perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Aoi WIS perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Aoi WIS perk 3
					  }
					  break;
			
		}
	}else if char==YUSUF{
		switch(stat){//ONLY UP-TO_DATE NUMBER IS AGI
			case DEF: if oldval<10 && newval>=10{
						//gain Yusuf def perk	
					  }break;
			case SPD: if oldval<25 && newval>=25{
						//gain Yusuf spd perk	
					  }break;
			case STR: if oldval<10 && newval>=10{
						//gain Yusuf STR perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Yusuf STR perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Yusuf STR perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Yusuf STR perk 3
					  }
					  break;
			case AGI: if oldval<7 && newval>=7{
						global.skills[YUSUF][4]=true;
					  }break;
			case CHA: if oldval<55 && newval>=55{
						//gain Yusuf CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if oldval<10 && newval>=10{
						//gain Yusuf DEX perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Yusuf DEX perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Yusuf DEX perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Yusuf DEX perk 3
					  }
					  break;
			case WIS: if oldval<10 && newval>=10{
						//gain Yusuf WIS perk 1	
					  }
					  if oldval<30 && newval>=30{	  
						//gain Yusuf WIS perk 2
					  }
					  if oldval<65 && newval>=65{	  
						//gain Yusuf WIS perk 3
					  }
					  if oldval<80 && newval>=80{	  
						//gain Yusuf WIS perk 3
					  }
					  break;
			
		}
	}
}

function checkForPerkLoss(char,stat,oldval,newval){
	if char == AOI{
		switch(stat){
			case DEF: if newval<10 && oldval>=10{
						//gain Aoi def perk	
					  }break;
			case SPD: if newval<25 && oldval>=25{
						//gain Aoi spd perk	
					  }break;
			case STR: if newval<10 && oldval>=10{
						//gain Aoi STR perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Aoi STR perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Aoi STR perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Aoi STR perk 3
					  }
					  break;
			case AGI: if newval<35 && oldval>=35{
						//gain Aoi AGI perk	
					  }break;
			case CHA: if newval<55 && oldval>=55{
						//gain Aoi CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if newval<10 && oldval>=10{
						//gain Aoi DEX perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Aoi DEX perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Aoi DEX perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Aoi DEX perk 3
					  }
					  break;
			case WIS: if newval<10 && oldval>=10{
						//gain Aoi WIS perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Aoi WIS perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Aoi WIS perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Aoi WIS perk 3
					  }
					  break;
			
		}
	}
	else if char==YUSUF{
		switch(stat){//ONLY UP-TO_DATE NUMBER IS AGI
			case DEF: if newval<10 && oldval>=10{
						//gain Yusuf def perk	
					  }break;
			case SPD: if newval<25 && oldval>=25{
						//gain Yusuf spd perk	
					  }break;
			case STR: if newval<10 && oldval>=10{
						//gain Yusuf STR perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Yusuf STR perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Yusuf STR perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Yusuf STR perk 3
					  }
					  break;
			case AGI: if newval<7 && oldval>=7{
						global.skills[YUSUF][4]=false;
					  }break;
			case CHA: if newval<55 && oldval>=55{
						//gain Yusuf CHA perk	
					  }break;
			//correct levels below this line
			case DEX: if newval<10 && oldval>=10{
						//gain Yusuf DEX perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Yusuf DEX perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Yusuf DEX perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Yusuf DEX perk 3
					  }
					  break;
			case WIS: if newval<10 && oldval>=10{
						//gain Yusuf WIS perk 1	
					  }
					  if newval<30 && oldval>=30{	  
						//gain Yusuf WIS perk 2
					  }
					  if newval<65 && oldval>=65{	  
						//gain Yusuf WIS perk 3
					  }
					  if newval<80 && oldval>=80{	  
						//gain Yusuf WIS perk 3
					  }
					  break;
			}
	}
}

function slot_perks(charIndex){
	var arr = [[//stat,minRequired,title,description
		[DEF,10,"",""],
		[STR,10,"",""],
		[DEX,5,"Scan","See the truth (enemy HP)"],
		[WIS,15,"",""],
		[SPD,25,"",""],
		[STR,30,"",""],
		[AGI,35,"",""],
		[WIS,40,"",""],
		[DEF,60,"",""],
		[STR,65,"",""],
		[CHA,55,"",""],
		[WIS,60,"",""],
		[DEF,80,"",""],
		[STR,80,"",""],
		[DEX,80,"",""],
		[WIS,80,"",""]
	],[
		[DEF,10,"",""],
		[AGI,7,"Skill","Unlock 'Cure Poison' skill"],
		[CHA,15,"",""],
		[DEX,10,"",""],
		[SPD,25,"",""],
		[STR,30,"",""],
		[CHA,35,"",""],
		[WIS,40,"",""],
		[DEF,60,"",""],
		[STR,65,"",""],
		[CHA,55,"",""],
		[WIS,60,"",""],
		[DEF,80,"",""],
		[SPD,80,"",""],
		[CHA,80,"",""],
		[DEX,80,"",""]
	]];
	return arr[charIndex];
}
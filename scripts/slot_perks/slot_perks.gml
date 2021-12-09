// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slot_perks(charIndex){
	var arr = [[//stat,minRequired,title,description
		[DEF,10,"",""],
		[STR,10,"",""],
		[DEX,15,"",""],
		[WIS,10,"",""],
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
		[AGI,10,"",""],
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
/// @description Passing the "isSelected" status to the next button

if (isSelected)&&(rightEast!=noone)&&frameHasPassed {
	  show_debug_message("Passing right from "+string(id)+" to "+string(rightEast.id));
	  isSelected = false;
      rightEast.isSelected = true;
}
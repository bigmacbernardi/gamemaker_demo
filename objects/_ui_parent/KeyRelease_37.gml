/// @description Passing the "isSelected" status to the next button

if (isSelected)&&(leftWest!=noone)&&frameHasPassed {
	  show_debug_message("Passing left from "+string(id)+" to "+string(leftWest.id));
	  isSelected = false;
      leftWest.isSelected = true;
}
   
/// @description Passing the "isSelected" status to the next button

if (isSelected) {
      button_skill.isSelected = true;
	  isSelected = false;
   }
else if (!(button_item.isSelected||button_skill.isSelected))
	  isSelected = true;
   
   
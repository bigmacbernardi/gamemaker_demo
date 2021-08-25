/// @description Overridden bc attack always has East option and is default (at least for now)

if (isSelected){
	  isSelected = false;
      rightEast.isSelected = true;
}
else if (battle_manager.allowInput && !button_item.isSelected && !button_skill.isSelected) isSelected = true;
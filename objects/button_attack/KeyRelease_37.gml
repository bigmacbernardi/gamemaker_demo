/// @description Overridden bc attack always has West option and is default (at least for now)

if (isSelected){
	  isSelected = false;
      leftWest.isSelected = true;
}
else if (battle_manager.allowInput && !button_item.isSelected && !button_skill.isSelected) isSelected = true;
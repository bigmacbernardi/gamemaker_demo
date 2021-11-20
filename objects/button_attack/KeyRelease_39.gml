/// @description Overridden bc attack always has East option and is default (at least for now)

if (isSelected && frameHasPassed){
	  isSelected = false;
	  show_debug_message("Trying to go right from attack "+string(id));
      rightEast.isSelected = true;
}
else if (battle_manager.allowInput && !button_item.isSelected && !button_skill.isSelected && !button_dual_wait.isSelected) isSelected = true;
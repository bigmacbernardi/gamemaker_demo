/// @description Overridden bc attack never has a North option (at least not yet) and is default
if (battle_manager.allowInput && !button_item.isSelected && !button_skill.isSelected)
	isSelected = true;

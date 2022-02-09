/// @description After destruction, update save slot and anything else
for (var i =ds_list_size(options)-1;i>=0;i--){
	instance_destroy(options[|i]);	
}
global.saveSlot = index;
/// @description Exits the menu
for (var i = ds_list_size(allOptions)-1; i >= 0;i--){
	instance_destroy(allOptions[|i]);
}
ds_list_destroy(options);
ds_list_destroy(allOptions);
obj_pausemenu_main.selected = true;

/// @description Starting this with a menu configurator.
//Must reference a global initialized with the label and function data
//(Functions SHALL NOT be executed in this mode, however, only assigned to globals.).
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
frameHasPassed = false;
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];
scrollLevel = 0; 
scrollLevel2 = 0;
options = ds_list_create();
ds_list_copy(options,global.equipment);
subY = y+sprite_height-50/*half spr_menu_temp.height*/;
front_sprites = [spr_aoi,spr_yusuf,spr_old_man,spr_old_man44];
mode = 0;
//mode 0: can select from list of characters OR list of equipment
//mode 1: has selected character from bottom part
//mode 2: has selected character from bottom AND slot from top part.  can only select equipment from right, or cancel out to previous mode.
//mode 3: has selected equipment from top-right.  must select character from bottom
//mode 4: has selected party member from bottom part AND equipment.  can only select slot from left, or cancel out to mode 3 or 0.
index2 = -1;//so none are selected at first
//index3 = 9;
subindex= 0;//equip slot; weapon,armor,offhand, accessory
filters=[[0,2,3,4],[1,3,4],[1,2,3,4,5,6,7,8,9]];
function filt(char){
	ds_list_destroy(options);
	options = ds_list_create();
	//var ii = 0;
	var ray = filters[char];
	for (var i = 0; i < ds_list_size(global.equipment);i++){
		var piece = global.equipment[|i];
		if piece.category==0{
			var passedFilter=false;
			for (var j = 0; j<array_length(ray);j++){
				if ray[j]==piece.type{
					passedFilter=true;
					break;
				}
			}
			if passedFilter
				ds_list_add(options,piece);		
		}else //if piece.category==cat
			ds_list_add(options,piece);
	}
}
function filter(char,cat){
	ds_list_destroy(options);
	options = ds_list_create();
	//var ii = 0;
	var ray = filters[char];
	for (var i = 0; i < ds_list_size(global.equipment);i++){
		var piece = global.equipment[|i];
		if piece.category==0 and cat==0{
			var passedFilter=false;
			for (var j = 0; j<array_length(ray);j++){
				if ray[j]==piece.type{
					passedFilter=true;
					break;
				}
			}
			if passedFilter
				ds_list_add(options,piece);	
		}else if piece.category==cat
			ds_list_add(options,piece);		
	}
}
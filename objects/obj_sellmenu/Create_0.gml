/// @description Can be used anywhere.
// You can write your code in this editor
x = camera_get_view_x(cam);
y = camera_get_view_y(cam);
selected = true;
sellMode = false;
depth = -999;
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//filterOptions = ["  All","Healing"," Battle","  Key","Sort"];
filterOptions = [" All"," Items Only","Equipment"];
numToSell=0;

//initialize options?

draw_set_font(Roses); 
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
options = ds_list_create(); //OPTION: [item, isInventory, index];
//doing equipment AND items. items first:
for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,[instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]),true,i]);
  if ((i % 3)==2){
	drawX = 0;
	drawY += 24;
  }else	drawX += 100;
  
}

//adding equipment herepr

//options = ds_list_create();
//allOptions = ds_list_create();

for (var i = 0; i < ds_list_size(global.equipment);i++){
	var piece = instance_create_depth(x,y,depth,global.equipment[|i][0]);
	piece.currentUser = global.equipment[|i][1];
	piece.index = i;
	ds_list_add(options,[piece,false,i]);
}
//ds_list_copy(options,allOptions);
mode = 0;//item MUST be selected first.  this ain't equipment
index2 = -1;
index3 = 0;
function filt(type){
	for (var i = ds_list_size(options)-1;i>-1;i--)
		instance_destroy(options[|i][0]);	
	ds_list_destroy(options);
	options = ds_list_create();
	var li = 0;
	var drawX = 0;
	var drawY = y;
	for (var i = 0; i < ds_list_size(global.inventory);i++){
		var piece = instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]);
		if type==0 or object_get_parent(global.inventory[|i][0])==type 
			or object_get_parent(object_get_parent(global.inventory[|i][0]))==type{
			ds_list_add(options,[piece,false,i]);
			if ((li++ % 3)==2){
				drawX = 0;
				drawY += 24;
			}else drawX += 100;
		}else instance_destroy(piece);
	}
	if index>=ds_list_size(options) index=0;
}
/*function filter(char,cat){
	ds_list_destroy(options);
	options = ds_list_create();
	//var ii = 0;
	var ray = filters[char];
	for (var i = 0; i < ds_list_size(global.inventory);i++){
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
}*/
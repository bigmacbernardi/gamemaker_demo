/// @description Can be used anywhere.
// You can write your code in this editor
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
options = [];//obj_pauseitem,obj_pauseequip,obj_pauseskill,obj_pausestat,obj_pauseteam,obj_pauseconfig];

//ds_list_create(); 
options[0]=instance_create_depth(drawX,drawY,depth-1,obj_pauseitem);
drawY += 24;
options[1]=instance_create_depth(drawX,drawY,depth-1,obj_pauseequip);
drawY += 24;
options[2]=instance_create_depth(drawX,drawY,depth-1,obj_pauseskill);
drawY += 24;
options[3]=instance_create_depth(drawX,drawY,depth-1,obj_pausestat);
drawY += 24;
options[4]=instance_create_depth(drawX,drawY,depth-1,obj_pauseteam);
drawY += 24;
options[5]=instance_create_depth(drawX,drawY,depth-1,obj_pauseconfig);
drawY += 24;
/*for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  drawY += 24;
}*/
selected=true;
portraits = [spr_mori,spr_musa,spr_old_man44,spr_old_man44,spr_old_man44,spr_old_man44];
lvBreaks = [0,200,600,1400,3000,6200,10000,30000,600000,
1600000,6400000,11600000,111600000,222600000,333600000,444600000,644600000,794600000,
1000000000,1500000000,2000000001,3000000002,4000000003,5000000004,5000000005,
5000000006,5500000006,5600000007,5700000008,5800000009,5900000010,
6000000006,6100000006,6200000007,6300000008,6400000009,6500000010,
6600000006,6700000007,6800000008,6900000009,
7000000006,7100000006,7200000007,7300000008,7400000009,7500000010,
7600000006,7700000007,7800000008,7900000009,7990000010,
8000000006,8100000006,8200000007,8300000008,8400000009,8500000010,
8600000006,8700000007,8800000008,8900000009,8990000010,
9000000006,9100000006,9200000007,9300000008,9400000009,9500000010,
9600000006,9700000007,9800000008,9900000009,
10000000006,10100000006,10200000007,10300000008,10400000009,10500000010,
10600000006,10700000007,10800000008,10900000009,
11400000006,12100000007,13400000008,14850000009,
16000000006,16030000010,16070000006,
16100000006,16200000007,16300000008,16400000009,16500000010,
16600000006,16700000007,16800000008,16900000009,16990000010
];//temporarily putting here till we globalize somehow
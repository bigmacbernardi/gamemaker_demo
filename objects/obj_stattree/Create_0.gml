/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_pausemenu_stat) instance_destroy();
var i = obj_pausemenu_stat.options[|obj_pausemenu_stat.index];
var mins = [[],[],[]];
var maxs = [[],[],[]];
var incs = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]];
curmax = maxs[i];
curmin = mins[i];
curinc = incs[i];
index = -1;
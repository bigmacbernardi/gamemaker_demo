/// @description Multivariate lighting effects
var px = obj_player.x;
var py = obj_player.y;
var i = 0, j=0;
while i<array_length(xs)-2 && xs[i+1]<px
	i++;
while j<array_length(ys)-2 && ys[j+1]<py
	j++;
//player is in the "grid box" corresponding to i,j:
//        |       |      col
//   0,0  |  1,0  |  2,0  |  3,0
//        |       |       |
// -----grid----------------------
//        |       |       |
//   0,1  |  1,1  |  2,1  |  3,1
//        |       |       |
// ----------row------------------
//        |       |       |
//   0,2  |  1,2  | 2,2   |  3,2
//        |      col      |
//actualColors indices are as follows:
//[0]    [1]     [2]     [3]     [4]
//   0,0  |  1,0  |  2,0  |  3,0
//        |       |       |
//[5]----[6]-----[7]-----[8]-----[9]
//        |       |       |
//   0,1  |  1,1  |  2,1  |  3,1
//        |       |       |
//[10]--[11]----[12]----[13]----[14]
//        |       |       |
//   0,2  |  1,2  | 2,2   |  3,2
//[15]  [16]    [17]    [18]    [19]
if ("Row "+string(j) +" of "+string(array_length(ys)-1)+", Column "+string(i)+" of "+string(array_length(xs)-1))!=lastString{
	show_debug_message("Row "+string(j) +" of "+string(array_length(ys)-1)+", Column "+string(i)+" of "+string(array_length(xs)-1));
	lastString="Row "+string(j) +" of "+string(array_length(ys)-1)+", Column "+string(i)+" of "+string(array_length(xs)-1);
}
var color_one = actualColors[(j*array_length(xs))+i];
var color_two = actualColors[(j*array_length(xs))+i+1];
var color_three = actualColors[((j+1)*array_length(xs))+i];
var color_four = actualColors[((j+1)*array_length(xs))+i+1];
var xgap = (px-xs[i])/(xs[i+1]-xs[i]);
var ygap = (py-ys[j])/(ys[j+1]-ys[j]);
var color_five=merge_color(color_one,color_two,xgap);
var color_six=merge_color(color_three,color_four,xgap);
//show_debug_message("Xgap"+string(xgap) +"; ygap: "+string(ygap));
//show_debug_message("Py"+string(py) +"; ["+string(ygap));
	
obj_player.image_blend = merge_color(color_five,color_six,ygap);
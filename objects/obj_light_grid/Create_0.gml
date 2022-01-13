/// @description Insert description here

//Example with 1 obj_light_grid, 2 obj_light_column, 1 obj_light_row:
//        |       |      col
//        |       |       | 
//        |       |       |
// -----this----------------------
//        |       |       |
//        |       |       |     
//        |       |       |
// ----------row------------------
//        |       |       |
//        |       |       |  
//        |      col      |
// colors: ([B] = Background, roomColor)
//[B]    [B]     [B]     [B]     [B]
//        |       |       | 
//        |       |       |
//[B]----[0]-----[1]-----[2]-----[B]
//        |       |       |
//        |       |       |     
//        |       |       |
//[B]----[3]-----[4]-----[5]-----[B]
//        |       |       |
//        |       |       |  
//[B]    [B]     [B]     [B]     [B]
//
//If placed at origin, does not create a left or upper "margin":
// this           |      col
//                |       | 
//                |       |
//                |       |
//                |       |     
//                |       |
// ----------row------------------
//                |       |
//                |       |  
//               col      |
// ([B] = Background)
//[0]            [1]     [2]     [B]
//                |       | 
//                |       |
//                |       |
//                |       |     
//                |       |
//[2]--------row-[3]-----[4]-----[B]
//                |       |
//                |       |  
//                |       |
//[B]            [B]     [B]     [B]
//same logic applies to putting columns and rows at (or beyond) the limits of the room
// this           |              col
//                |         
//                |        
//                |        
//                |             
//                |        
//                |
//                |        
//               col          
//       row      |   
//colors:
//[0]            [1]             [2]
//                |         
//                |        
//                |        
//                |             
//                |        
//[3]            [4]             [5]
//                |        
//                |          
//               col       
//[6]   row      [7]             [8]
var leftMargin = 1;
var rightMargin = 1;
var upperMargin = 1;
var lowerMargin = 1;
xs =[min(0,x)];//= x <= 0?[0]:[0,x];
ys =[min(0,y)];//= y <= 0?[0]:[0,y];
var columns = ds_priority_create();
var rows = ds_priority_create(); 
var i;
if x>0 ds_priority_add(columns,x,x);
else leftMargin=0;
for (i=0;i < instance_number(obj_light_column);i++){
	var inst = instance_find(obj_light_column,i);
	ds_priority_add(columns,inst.x,inst.x);
}
if y>0 ds_priority_add(rows,y,y);
else upperMargin=0;
for (i=0;i < instance_number(obj_light_row);i++){
	var inst = instance_find(obj_light_row,i);
	ds_priority_add(rows,inst.y,inst.y);
}
i = 1;
while ds_priority_size(columns)>0{
	xs[i++] = ds_priority_delete_min(columns);
}
if xs[i-1] < room_width
	xs[i]= room_width;//right margin
else rightMargin = 0;
i = 1;
while ds_priority_size(rows)>0{
	ys[i++] = ds_priority_delete_min(rows);
}
if ys[i-1] < room_height
	ys[i]= room_height;//lower margin
else lowerMargin=0;
ds_priority_destroy(columns);
ds_priority_destroy(rows);
actualColors=[];
var row_size = array_length(xs);
var col_size = array_length(ys);
var ii=0;//inner index; which value of array colors we're up to
if upperMargin{
	for (i=0;i < row_size;i++)
		actualColors[i]=roomColor;
	if rightMargin actualColors[i++]=roomColor;
		
}else i = 0;
for (var j = upperMargin; j<col_size;j++){
	//here, "i" should be equal to j*row_size
	show_debug_message("i: "+string(i)+" j*row_size: "+string(j*row_size))
	if leftMargin actualColors[i++]=roomColor;	
	for (;i<(j*row_size)+row_size-rightMargin;i++){
		show_debug_message(string(ii)+" of "+string(array_length(colors))+" colors");
	
		if ii<array_length(colors)
			actualColors[i]=colors[ii++];
		else actualColors[i]=roomColor;//default, which should handle lower margin
	}
	if rightMargin actualColors[i++]=roomColor;	
}
//If user wants to specify ALL of the points, and does everything to make it so, let them!
if array_length(actualColors)=array_length(colors){
	actualColors = colors;
	for (i=0;i<array_length(colors);i++){
		if colors[i]==0{//blank
			if i==0 or i==row_size-1 or i==array_length(colors)-row_size or array_length(colors)-1
				actualColors[i]= thisColor;
			else if i<row_size-1 or i>array_length(colors)-row_size//top or bottom row
				actualColors[i] = merge_color(colors[i-1],colors[i+1],.5);
			
			else if i%row_size==0 or i%row_size==row_size-1 //left or right column
				actualColors[i] = merge_color(colors[i-row_size],colors[i+row_size],.5);
			
			else{
				var color_one =  merge_color(colors[i-1],colors[i+1],.5);
				var color_two =  merge_color(colors[i-row_size],colors[i+row_size],.5);
				actualColors[i] = merge_color(color_one,color_two,.5);
			}
		}
	}
		
}
while instance_exists(obj_light_row) instance_destroy(obj_light_row);
while instance_exists(obj_light_column) instance_destroy(obj_light_column);
lastString = "";
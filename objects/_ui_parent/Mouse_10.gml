/// @description A mouseover shared by all menu elements

isSelected = true;
// Naive way to tune down some double attacks; single-object selection management would honestly be better
if (upNorth != noone) upNorth.isSelected = false;
if (downSouth != noone) downSouth.isSelected = false;
if (leftWest != noone) leftWest.isSelected = false;
if (rightEast != noone) rightEast.isSelected = false;

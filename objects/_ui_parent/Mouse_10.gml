/// @description A mouse overshared by all menu elements
// Naive way to tune down some double attacks, single-object management honestly better

isSelected = true;
if (upNorth != noone) upNorth.isSelected = false;
if (downSouth != noone) downSouth.isSelected = false;
if (leftWest != noone) leftWest.isSelected = false;
if (rightEast != noone) rightEast.isSelected = false;

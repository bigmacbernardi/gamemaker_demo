/// @description Update the UI Element's Position	
//Gui Size
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
//View Guide Size
var _vw = sprite_get_width(spr_guide);
var _vh = sprite_get_height(spr_guide);
//Center Position for Guide
var _vcx = _vw/2;
var _vcy = _vh/2;
//Starting location
var _x=xstart;
var _y=ystart;
//Identify all offsets for various anchors
var _posx = [_x,    _gw/2-(_vcx-_x),    _gw-(_vw-_x)];
var _posy = [_y,    _gh/2-(_vcy-_y),    _gh-(_vh-_y)];

//Apply Offsets based on current anchor
#region Anchor position
switch(anchor)
{
	//Top
	case Anchor.top_left:
			 x=_posx[Alignment.left];
			 y=_posy[Alignment.top];
			 break;
	case Anchor.top_center:
			 x=_posx[Alignment.center];
			 y=_posy[Alignment.top];
			 break;
	case Anchor.top_right: 
			 x=_posx[Alignment.right];
			 y=_posy[Alignment.top];
			 break;
	//Middle		 
	case Anchor.middle_left:
			 x=_posx[Alignment.left];
			 y=_posy[Alignment.middle];
	     break;
	case Anchor.middle_center:
			 x=_posx[Alignment.center];
			 y=_posy[Alignment.middle];
			 break;
	case Anchor.middle_right:
			 x=_posx[Alignment.right];
			 y=_posy[Alignment.middle];
			 break;
	//Bot		 
	case Anchor.bottom_left:
			 x=_posx[Alignment.left];
			 y=_posy[Alignment.bottom];
			 break;
	case Anchor.bottom_center:
			 x=_posx[Alignment.center];
			 y=_posy[Alignment.bottom];
			 break;
	case Anchor.bottom_right:
			 x=_posx[Alignment.right];
			 y=_posy[Alignment.bottom];
}
#endregion

active_pos = [x,y];
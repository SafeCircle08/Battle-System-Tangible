drawText = [];
actualArray = [];
yAdder = 0;
xAdder = 0;
textDelay = 0;
canSkip = false;
separationBuffer = 0;

itemOutputMessageText = false;

image_xscale = 1;
image_yscale = 1;


drawItemOutPutText = function() {
	draw_set_font(fHungrySkinny);
	var _bg = setToGuiBgSelectedTheme();
	var _bgW = sprite_get_width(_bg) * 3;
	var _w = _bgW + 40;
	var _sep = 20;
	var _scale = 0.5;
	var _angle = 0;
	
	var _itemOutPutTxt = actualArray;
	var _itemOutPutTxtX = x;
	var _itemOutPutTxtY = y;
	if (string_length(actualArray) > 45) { _itemOutPutTxtY = y - 2; }
	
	draw_text_ext_transformed(
		_itemOutPutTxtX + 1,  _itemOutPutTxtY, _itemOutPutTxt, 
		_sep, _w, _scale, _scale, _angle
	);		
}
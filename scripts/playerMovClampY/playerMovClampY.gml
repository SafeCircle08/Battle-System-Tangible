function playerMovClampY(){
	var _h = 5;
	var _possY = clamp(oSoul.y, global.border_u + _h, global.border_d - _h);
	oSoul.y = _possY;
}
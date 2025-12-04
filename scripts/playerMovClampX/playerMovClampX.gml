function playerMovClampX(){
	var _w1 = 7;
	var _w2 = 5;
	var _possX = clamp(oSoul.x, global.border_l + _w1, global.border_r - _w2);
    oSoul.x = _possX;
}
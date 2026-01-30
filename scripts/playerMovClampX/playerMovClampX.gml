function playerMovClampX(_w1 = 7, _w2 = 5){
	if (!oBattleBox.boxAnimationWidthFinished()) return;
	var _possX = clamp(oSoul.x, global.border_l + _w1, global.border_r - _w2);
    oSoul.x = _possX;
}
function playerMovClampY(){
	if (!oBattleBox.boxAnimationHeightFinished()) return;
	var _h = 6;
	var _possY = clamp(oSoul.y, global.border_u + _h, global.border_d - _h);
	oSoul.y = _possY;
}
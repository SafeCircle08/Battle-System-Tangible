function createNewPlayerStateInfo(
	_state, _startSpr, _fxSpr, _angle,
	_pov, _hbX, _hbY, _xOffSet, _yOffSet
)
{
	var _mystateInfos = {
		state: _state,
		startSprite: _startSpr,
		effectSpr: _fxSpr,
		angle: _angle,
		pov: _pov,
		hbX: _hbX,
		hbY: _hbY,
		xOffSet: _xOffSet,
		yOffSet: _yOffSet
	}
	return _mystateInfos;
}

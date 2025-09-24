function fade(
	_sX, _sY, _fX, _fY,
	_scaleXAm, _scaleYAm, _scale0Destroy,
	_sA, _fA, _alphaAmount, _destroyAlpha0) {
	changeDimension(_sX, _sY, _fX, _fY, _scaleXAm, _scaleYAm, _scale0Destroy);
	changeAlphaValue(_sA, _fA, _alphaAmount, _destroyAlpha0);
}
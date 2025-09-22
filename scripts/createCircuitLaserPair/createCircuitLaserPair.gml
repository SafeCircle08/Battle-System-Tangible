function createCircuitLaserPair(_laserPairX, _laserPairY, _angle, _timer,_inGroup = true, _dist = 1) {
	var _laserPairInst = instance_create_layer(_laserPairX, _laserPairY, 
		LAYER_EXTRAS_OBJECTS, oLaserPair, { image_angle: _angle, image_yscale: _dist });
	_laserPairInst.timerRef = _timer;
	_laserPairInst.timer = _timer;
	_laserPairInst.isInAGroup = _inGroup;
}
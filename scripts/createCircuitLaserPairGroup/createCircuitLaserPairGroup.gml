function randomTimers(_n, _max, _min) {
	var _randomTimersList = [];
	for (var i = 0; i < _n; i++) {
		var _time = irandom_range(_min, _max);
		array_push(_randomTimersList, _time);
	}
	return _randomTimersList;
}


function createCircuitLaserPairGroup(_x, _y, _number, _mode, _angle = 0) {
	
}
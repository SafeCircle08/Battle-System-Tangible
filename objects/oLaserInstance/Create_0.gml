laseringTimer = 70;

creator = 0;

isOnCreation = true;
isOnLasering = false;
isOnTurningOff = false;

frame = 0;

image_xscale = 0.4;

checkAllLaserPairInstances = function() {
	var _lasersInAGroup = 0;
	var _lasersInAGroupTurnedOff = 0;
	for (var i = 0; i < instance_number(oLaserPair); i++) {
		var _actualPair = instance_find(oLaserPair, i);
		
		if (_actualPair.isInAGroup == true) {
			if (_actualPair.timer == -1) {
				_lasersInAGroupTurnedOff++;	
			}
			_lasersInAGroup++;
		}
		
		if (_lasersInAGroupTurnedOff == _lasersInAGroup) {
			for (var j = 0; j < instance_number(oLaserPair); j++) {
				var _newFinalPairCheck = instance_find(oLaserPair, j);
				if (_newFinalPairCheck.isInAGroup == true) { _newFinalPairCheck.startOver(); }
			}
		}
	}
}

setToLasering = function() {
	isOnCreation = false;
	isOnLasering = true;		
}

setToTurnOff = function() {
	isOnLasering = false;
	isOnTurningOff = true;
}

onCreation = function() {
	if (changeDimension(0, 0, 1, 5, 0, 0.2, false)) {
		setToLasering();
	}
}

lasering = function() {
	laseringTimer = setTimer(laseringTimer);
	var _yScaleSin = abs(sin(delta_time / 1_000_000) * 5);
	image_yscale += _yScaleSin;
	if (laseringTimer == 0) {
		setToTurnOff();
	}
}

turnOff  = function() {
	changeDimension(1, 5, 0, 0, 1, 0.3, true);	
}


laserRayStepFunction = function() {
	if (isOnCreation) { onCreation(); }	
	else if (isOnLasering) { lasering(); }
	else if (isOnTurningOff) { turnOff(); } 
}


















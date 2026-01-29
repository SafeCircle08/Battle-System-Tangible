function setUpPlayerStateVars(_globalStateInfo) {
	state = _globalStateInfo.state;
	startX = x;
	startY = y;
	hbX = _globalStateInfo.hbX;
	hbY = _globalStateInfo.hbY;
	selectedState = _globalStateInfo;
	sprite_index = _globalStateInfo.startSprite;
	image_angle = _globalStateInfo.angle;
	global.pov = _globalStateInfo.pov;
}

function playerChangeState(_globalStateInfo, _additionlVarsMethod = function() {}) {
	with (oSoul) {
		setUpPlayerStateVars(_globalStateInfo);	
		_additionlVarsMethod();
		
		if (global.beamAnimation == 0) {
			createPlayerStateEffect(_globalStateInfo.effectSpr);
			return;
		}	
	}
}

function additionalGravityStateMethod(_newGravityState) {
	var _changeJumpPower = 5;
	with (oSoul) {
		if (inUseGravity.horizontal) { vsp += _changeJumpPower * -inUseGravity._sign; }
		else { vsp += _changeJumpPower * -inUseGravity._sign; }
		vsp = clamp(vsp, -2, 2);
		image_angle = inUseGravity.angle;
		gravCreateRightGravityBorder(inUseGravity.boxSidePlatformToCreate);
	}		
}
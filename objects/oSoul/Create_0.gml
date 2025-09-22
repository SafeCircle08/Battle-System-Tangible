key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);
key_jumpPressed = keyboard_check(vk_space);

damageTaken = 0;

//Such as poisoned, on fire, dark vision etc...
segnalini = [];
isOnSegnalino = false;
segnalinoFuncTimer = 0;
segnalinoFunc = 0;
segnalinoName = "";

stepSegnalinoFunc = function() {
	if (isOnSegnalino) {
		segnalinoFuncTimer = setTimer(segnalinoFuncTimer);
		if (segnalinoFuncTimer > 0) {
			segnalinoFunc();
		} else {
			isOnSegnalino = false;	
		}
	}
}

stopSegnalino = function(_checkForSpecificSegnalino = false, _specificSegnalino = "") {
	if (_checkForSpecificSegnalino == false) {
		segnalinoFunc = function() {}
		segnalinoFuncTimer = 0;
	} else {
		if segnalinoName == _specificSegnalino {
			segnalinoFunc = function() {}
			segnalinoFuncTimer = 0;	
		}
	}
}


setSegnalino = function(_segnalinoFunc, _segnalinoTimer, _segnalinoName) {
	if (isOnSegnalino == false) {
		isOnSegnalino = true;
		segnalinoFunc = _segnalinoFunc;
		segnalinoFuncTimer = _segnalinoTimer;
		segnalinoName = _segnalinoName;
	}
}


startX = x;
startY = y;

basicPlayerVars();
beamTimerVars();
shaderVars();

stateFreeLoad();
stateMirroredLoad();
stateUmbrellaLoad();
stateUsingUmbrella();
stateGravityLoad();
stateSpiderLoad();
stateCartingLoad();
stateCircuitLoad();

state = stateFree;

loadPlayerStateInfo();
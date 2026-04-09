groupN = 0;
group = oSteamPunkMaskParent.chooseEye();
delay = 15;
canStart = false;

spawnElectroBallGroup = function(_groupN = 5, _timeDelay = delay) {
	static t = 0;
	t++;
	
	var _xAdder = irandom_range(-5, 5);
	var _yAdder = irandom_range(-5, 5);
	if (t % _timeDelay == 0) { 
		oSteamPunkMaskParent.spawnElectroBall(false, _xAdder, _yAdder, group);
		groupN++;
		if (groupN == _groupN) instance_destroy(self);
	}
}
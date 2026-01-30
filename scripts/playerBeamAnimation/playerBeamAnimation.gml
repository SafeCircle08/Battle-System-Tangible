//Utilities--------------------------------
function resetBeamAnimationVariables() {
	global.beamAnimation = false;
	with (oPlayerBeam) {
		oPlayerBeam.indexMax = 0;
		oPlayerBeam.beamHeight = 300;			
	}
}

function startBeamAnimation(startOfTurn = true)  { 
	if (startOfTurn == false) { 
		playerFillShield();
		destroyBulletsGensExtras();
	}
	oSoul.canState = false;
	beamAnimationSetToStart();
}
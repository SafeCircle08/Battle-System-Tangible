if (!beamAnimationEnded()) { 
	increaseBlackBgAlpha();
	exit;
}
  
if (maskReady == false) {
	maskEnterIn();
	exit;
}

//other functions goes there
//executed only after the mask entered in;

//Set Function
if (global.enemyTimer == global.enemyAttackTime - 150) { maskSetFadingOut(); }

//Performing the set function function
if (maskOnFadingOut) { 
	maskFadingOut();
	exit;
}

if (maskOnIdle) { maskIdling(); }

if (maskOnBlueprint) { maskShowingBlueprint(); }

if (global.enemyTimer % 120 == 0) spawnElectroBall(true);
//if (global.enemyTimer % 150 == 0) createElectroBallGroup(choose(4, 5, 6));
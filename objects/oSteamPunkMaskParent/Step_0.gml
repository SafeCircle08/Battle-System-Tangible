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
if (maskOnFadingOut) { maskFadingOut(); }
if (maskOnIdle) { maskIdling(); }
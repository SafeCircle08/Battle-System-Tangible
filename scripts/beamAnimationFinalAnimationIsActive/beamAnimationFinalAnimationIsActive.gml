function beamAnimationFinalAnimationIsActive(){
	return (global.enemyTimer > global.enemyAttackTime - BEAM_ANIMATION_TIMER_REF);
}
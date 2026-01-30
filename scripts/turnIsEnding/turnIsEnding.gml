function turnIsEnding() {
	return (global.enemyTimer > global.enemyAttackTime - BEAM_ANIMATION_TIMER_REF);
}

function turnIsEndingFrame(_framesBeforeTurnEnds = BEAM_ANIMATION_TIMER_REF) {
	return (global.enemyTimer == global.enemyAttackTime - _framesBeforeTurnEnds);	
}
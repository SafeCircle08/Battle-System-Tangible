function turnIsEnding() {
	return (global.enemyTimer > global.enemyAttackTime - 60);
}

function turnIsEndingFrame(_framesBeforeTurnEnds = 60) {
	return (global.enemyTimer == global.enemyAttackTime - _framesBeforeTurnEnds);	
}
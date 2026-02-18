function startBattle(_enemyInfo = function() {}, _enemyIntro = false, _introTxt = []) {
	room_goto(Room_Battle);
	_enemyInfo();
	
	var _myBattleManager = instance_create_layer(x, y, "Instances", oBattleManager);
	
	oPlayerOW.savePlayerInfosWhenBattleStarts();
	
	if (_enemyIntro) {
		_myBattleManager.hasEnemyIntro = _enemyIntro;
		_myBattleManager.enemyIntroText = _introTxt;
	}
}
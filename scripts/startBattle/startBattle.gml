#macro HAS_INTRO true
#macro BULLET_HELL_AFTER_INTRO true

function startBattle(_enemyInfo = function() {}, _enemyIntro = false, _bulletHellAfterIntro = false, _introTxt = []) {
	oPlayerOW.savePlayerInfosWhenBattleStarts();
	
	room_goto(Room_Battle);
	_enemyInfo();
	
	var _myBattleManager = instance_create_layer(x, y, "Instances", oBattleManager);
	if (_enemyIntro) {
		_myBattleManager.hasEnemyIntro = _enemyIntro;
		_myBattleManager.enemyIntroText = _introTxt;
		_myBattleManager.bulletHellAfterIntro = _bulletHellAfterIntro;
	}
}
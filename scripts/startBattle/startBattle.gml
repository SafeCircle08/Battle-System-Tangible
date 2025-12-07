function startBattle(_enemyInfo = function() {}) {
	room_goto(Room_Battle);
	_enemyInfo(); //loads all the infos of the enemy
	view_visible[0] = false;
	view_visible[1] = true;
}
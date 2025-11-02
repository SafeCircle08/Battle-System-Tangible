function resetCardsPositions(_newY = room_height) {
	for (var i = 0; i < instance_number(oSegnalinoCard); i++) {
		var _actualCard = instance_find(oSegnalinoCard, i);
		_actualCard.moving = false;
		_actualCard.y = room_height + 20;
	}
}
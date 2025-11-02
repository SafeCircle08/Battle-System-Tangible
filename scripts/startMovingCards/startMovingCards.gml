function startMovingCards() {
	for (var i = 0; i < instance_number(oSegnalinoCard); i++) {
		var _actualCard = instance_find(oSegnalinoCard, i);
		_actualCard.moving = true;
	}	
}
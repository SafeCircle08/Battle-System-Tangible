function removeSegnalini(_showRemovedSegNames = true) {
	for (var i = instance_number(oSegnalinoParent) - 1; i >= 0; i--) {
		var _actualSeg = instance_find(oSegnalinoParent, i);
		removeSegnalino(_actualSeg, _showRemovedSegNames);
	}
}
function removeSegnalino(_segnalinoObj, _writeRemovedSegNames = true) {
	if (instance_exists(_segnalinoObj)) { 
		with (_segnalinoObj) {
			removeRealSegnalino();
			var _segName = string_copy(name, 0, string_length(name) - 2);
			if (_writeRemovedSegNames) { addNewActionFlavourTextPage(_segName + " effects\n cleared");  }
			instance_destroy();
		}
	}
}
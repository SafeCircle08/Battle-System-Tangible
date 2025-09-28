function removeSegnalino(_segnalinoObj) {
	if (instance_exists(_segnalinoObj)) { 
		_segnalinoObj.destroySegnalino();
		instance_destroy(_segnalinoObj); 
	}
}
#macro SEGNALINO_NIGHT_VISION "night_vision"

function setToDarkVision() {
	var _setToDark = function() {
		if (!instance_exists(oDarkVision) && (oBattleManager.isInBulletHellSection())) {
			instance_create_layer(oSoul.x, oSoul.y, LAYER_EFFECT_TOP_3, oDarkVision);	
		}
	}
	oSoul.setSegnalino(_setToDark, 1000, SEGNALINO_NIGHT_VISION);
}
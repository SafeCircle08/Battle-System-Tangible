function openBattleBook(_layer = LAYER_EFFECT_TOP) {
	instance_create_layer(x, y, _layer, oBattleInvBookManager);	
	playSound(sndSwipe_1, SOUND_CHANNEL_1, false, 0.2);
}
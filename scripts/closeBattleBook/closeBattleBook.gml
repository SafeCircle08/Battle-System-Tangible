function closeBattleBook() {
	if (instance_exists(oBattleInvBookManager)) {
		oBattleInvBookManager.setToFadeOut();
		playSound(sndSwipe_2, SOUND_CHANNEL_1, false, 0.2);
	}
}
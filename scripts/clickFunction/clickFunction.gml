function clickFunction(_fxSpr, _playSound = true, _snd = sndBasicSoundClick) {
	if (_playSound) { playSound(_snd, SOUND_CHANNEL_3); }
	if (_fxSpr != undefined) { 
		createClickFX(_fxSpr);
		return; 
	}
}
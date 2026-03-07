function canPlayTextVoice(_text) {
	return (charCount mod 1 == 0) && (string_char_at(_text, charCount) != " ")
}

function playVoice(_voiceIndex, _voiceSoundGain, _text) {
	if (canPlayTextVoice(_text)) {
		playSound(_voiceIndex, SOUND_CHANNEL_2, false, _voiceSoundGain);	
	}
}
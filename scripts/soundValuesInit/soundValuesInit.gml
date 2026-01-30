//Gloval values for the sounds and music
//In that way, we can change the 
//gain of each sound or music by will.
//Useful for menus. (volume setting)

//Sound channels based on priority
#macro SOUND_CHANNEL_1 10
#macro SOUND_CHANNEL_2 20
#macro SOUND_CHANNEL_3 30
#macro SOUND_CHANNEL_4 40
#macro SOUND_CHANNEL_5 50

//Music channels based on priority
#macro MUSIC_CHANNEL 80
#macro MUSIC_CHANNEL_2 90

global.soundGain = 1;
global.musicGain = 1;

function playSound(sndIndex, sndChannel, loop = false, gainValue = 1) {
	audio_play_sound(sndIndex, sndChannel, loop, global.soundGain * gainValue);
}

function playSoundNotPlaying(_snd, _sndCh, _loop = false, _gainValue = 1) {
	if (!audio_is_playing(_snd)) { playSound(_snd, _sndCh, _loop, _gainValue); }
}

function playSoundPitch(sndIndex, sndChannel, loop = false, gainValue = 1, _minPitch = 0, _maxPitch = 1) {
	var _pitch = irandom_range(_minPitch, _maxPitch);
	audio_play_sound(sndIndex, sndChannel, loop, global.soundGain * gainValue, 0, _pitch);
}

function playMusic(mscIndex, mscChannel, loop = true, gainValue = 1) {
	audio_play_sound(mscIndex, mscChannel, loop, global.musicGain * gainValue);
}
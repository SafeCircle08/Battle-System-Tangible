function drawFormattedWaveyText(_x, _y, _string, _lSep, _color = c_white, scale = 1, _intensity = 200, amp = 1) {
	drawWaveyText(_x + 0.5, _y + 0.5, _string, _lSep, setToGuiTextBgColorSelectedTheme(), _intensity, amp, scale);
	drawWaveyText(_x, _y, _string, _lSep, _color, _intensity, amp, scale);
}
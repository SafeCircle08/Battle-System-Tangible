function drawFormatShakyText(_x, _y, _string, _lSep, _color = c_white, scale = 1, _intensity = 0.5, amp = 1){
	drawShakyText(_x + 0.5, _y + 0.5, _string, _lSep, setToGuiTextBgColorSelectedTheme(), scale);
	drawShakyText(_x, _y, _string, _lSep, c_white);
}
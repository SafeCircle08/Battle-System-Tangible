function drawFormatTypeWriterText(_x, _y, _string, _lSep, _prop = 0.4, _color = c_white, scale = 1){
	drawTypeWriterText(_x, _y, _string, _lSep, _prop, setToGuiTextBgColorSelectedTheme(), scale);
	drawTypeWriterText(_x, _y, _string, _lSep, _prop, _color, scale);
}
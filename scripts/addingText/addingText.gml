function createPage(_text, _faceSprRef, _moods, _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	var _page = {
		contents: _text,
		faceSprRef: _faceSprRef,
		expression: _moods,
		effect: _fxWanted,
		destroyPageFunc: _func,
		color: _color			
	}
	array_push(self.pagesList, _page);
}



function addNormalPage(_text,  _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	createPage(_text, noone, noone, _fxWanted, _func, _color);
}

function addCharacterPage(_text, _faceSprRef, _moods, _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	createPage(_text, _faceSprRef, _moods, _fxWanted, _func, _color);
}
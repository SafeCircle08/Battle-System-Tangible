//Only creates the page. Won't add it to the textTrigger pagesList.
function createPageBasic(
	_text, _faceSprRef, _moods, 
	_fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, 
	_func = function() {  }, _color = setToGuiTextColorSelectedTheme(), 
	_isMinigame = false, _minigameType = MINIGAMES.NOONE)
{
	var _page = {
		contents: _text,
		faceSprRef: _faceSprRef,
		expression: _moods,
		effect: _fxWanted,
		destroyPageFunc: _func,
		color: _color,
		isMinigame: _isMinigame,
		minigameType: _minigameType
	}
	return _page;
}

//Already add its page to textTrigger pagesList.
function createPage(
	_text, _faceSprRef, _moods, 
	_fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, 
	_func = function() {  }, _color = setToGuiTextColorSelectedTheme(), 
	_isMinigame = false, _minigameType = MINIGAMES.NOONE) 
{
	var _page = createPageBasic(_text, _faceSprRef, _moods, _fxWanted, _func, _color, _isMinigame, _minigameType);
	array_push(self.pagesList, _page);
}

function addMinigamePage(_minigameType) {
	createPage("", noone, noone, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, function() {}, setToGuiTextColorSelectedTheme(), true, _minigameType);
}

function addNormalPage(_text,  _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	createPage(_text, noone, noone, _fxWanted, _func, _color);
}

function addCharacterPage(_text, _faceSprRef, _moods, _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	createPage(_text, _faceSprRef, _moods, _fxWanted, _func, _color);
}
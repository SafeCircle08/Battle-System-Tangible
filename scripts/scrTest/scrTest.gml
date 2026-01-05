
function setEnemyBattlePage(_txt, _facialExpr = FACIAL_EXPRESSIONS.FACIAL_HIDDEN_FACE) {
	var _page = {
		text:  _txt,
		sprite: _facialExpr
	}
	return _page;
}

global.textTest = [
	[
		setEnemyBattlePage("Io sono molto fico!", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACIAL_EXPRESSIONS.FACIAL_ANGRY)
	],
	[
		setEnemyBattlePage("No dai scherzavo lol", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACIAL_EXPRESSIONS.FACIAL_ANGRY)
	]
];

var _turn = 1;
global.rightText = [];

var _block = global.textTest[_turn];

for (var i = 0; i < array_length(_block); i++) {
	array_push(global.rightText, _block[i].text);	
}

print(global.rightText)
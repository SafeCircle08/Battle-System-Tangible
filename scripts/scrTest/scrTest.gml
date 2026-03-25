
function setEnemyBattlePage(_txt, _facialExpr = FACES.HIDDEN) {
	var _page = {
		text:  _txt,
		sprite: _facialExpr
	}
	return _page;
}

global.textTest = [
	[
		setEnemyBattlePage("Io sono molto fico!", FACES.ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACES.ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACES.ANGRY),
		setEnemyBattlePage("D'altronde, io sono lo SCIENTISTA QUI!", FACES.ANGRY)
	],
	[
		setEnemyBattlePage("No dai scherzavo lol", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY),
		setEnemyBattlePage("Sono un tipo abbastanza tranquillo in realtà", FACES.ANGRY)
	]
];

var _turn = 1;
global.rightText = [];

var _block = global.textTest[_turn];

for (var i = 0; i < array_length(_block); i++) {
	array_push(global.rightText, _block[i].text);	
}
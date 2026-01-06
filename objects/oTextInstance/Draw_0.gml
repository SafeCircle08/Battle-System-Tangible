draw_self();

if (inBattle) {
	if (oBattleManager.isInBulletHellSection()) { exit; }
}

var _xx = camera_get_view_x(view_camera[view_current]);
var _yy = camera_get_view_y(view_camera[view_current]);

drawTextBoxText(text, font, hasCharacter, isActionsFlavourText, inBox, inBattle, sound, enemySpeech, txtX, txtY);
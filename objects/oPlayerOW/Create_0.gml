hsp = 0;
vsp = 0;
canMove = true;
owSpd = 1.5;
shading = false;
triggeredChangeRoomTrigger = false;
playerFacing = PLAYER_FACING_CHECK.FACING_NOONE;

xPosBattleStart = 0;
yPosBattleStart = 0;
sprBattleStart = sPlayerOwFront;

isStill = function() {
	return (hsp == 0) && (vsp == 0);	
}

savePlayerInfosWhenBattleStarts = function() {
	xPosBattleStart = x;
	yPosBattleStart = y;
	sprBattleStart = sprite_index;
}

applyBattleStartInfos = function() {
	x = xPosBattleStart;
	y = yPosBattleStart;
	sprite_index = sprBattleStart;
}

disableMovement = function() {
	canMove = 0;
	hspd = 0;
	vspd = 0;
	image_speed = 0;
	image_index = 0;
}

enableMovement = function() {
	canMove = true;	
}

playerOWReadingText = function() { if (instance_exists(oTextInstance)) { return true; } return false; }

function startChangeRoom(_dest, _newX, _newY) {
	var _myTrans = instance_create_depth(oCamera.finalCamX, oCamera.finalCamY, -9999, oTransitionRoom);
	_myTrans.destination = _dest;
	_myTrans.playerX = _newX;
	_myTrans.playerY = _newY;
}

managePlayerMovement = function() {
	var key_right = keyboard_check(ord("D")); 
	var key_left = keyboard_check(ord("A")); 
	var key_up = keyboard_check(ord("W"));
	var key_down = keyboard_check(ord("S"));
	
	if (key_up) { sprite_index = sPlayerOwBehind; image_speed = 1; playerFacing = PLAYER_FACING_CHECK.FACING_UP; }
	if (key_down) { sprite_index = sPlayerOwFront; image_speed = 1; playerFacing = PLAYER_FACING_CHECK.FACING_DOWN; }
	if (key_right) { sprite_index = sPlayerOwRight; image_speed = 1; playerFacing = PLAYER_FACING_CHECK.FACING_RIGHT; }
	if (key_left) { sprite_index = sPlayerOwLeft; image_speed = 1; playerFacing = PLAYER_FACING_CHECK.FACING_LEFT; }	
	
	hsp = (key_right - key_left) * owSpd;
	vsp = (key_down - key_up) * owSpd;

}

charCount = 0;

checkingText = function() {
	var _trigger = instance_place(x, y, oTextTrigger);
	
	if ((_trigger) && ((keyboard_check_pressed(vk_enter)))) {
		
		var _canCreateText = false;
		
		if (_trigger.playerShouldFace == PLAYER_FACING_CHECK.FACING_ALL) { _canCreateText = true; } 
		else if (playerFacing == _trigger.playerShouldFace) { _canCreateText = true; }
		if (playerFacing == _trigger.playerExcludePosFace) { _canCreateText = false; }
		
		if (_canCreateText) { _trigger.createTextInst(); }
	}
}

timer = 0;
char_index = 0;
text = "";
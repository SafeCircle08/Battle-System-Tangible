hsp = 0;
vsp = 0;
canMove = true;
owSpd = 1.5;
shading = false;
triggeredChangeRoomTrigger = false;
playerFacing = PLAYER_FACING_CHECK.FACING_NOONE;

stopMovement = function() {
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
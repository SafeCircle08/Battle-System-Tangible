if (room == Room_Battle) { exit; }

if (canMove == true) {
	managePlayerMovement();
	if (place_meeting(x + hsp, y, oWall)) { hsp = 0; image_speed = 0; image_index = 0; } 
	if (place_meeting(x, y + vsp, oWall)) { vsp = 0; image_speed = 0; image_index = 0; } 

	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	x += hsp;
	y += vsp;
}


//Change Room trigger
var _roomTrigger = instance_place(x, y, oChangeRoomTrigger);

if (_roomTrigger) && (!instance_exists(oTransitionRoom)) {
	var _destRoom = _roomTrigger.rm_destination; 
	var _playerX = _roomTrigger.destPlayerX;
	var _playerY = _roomTrigger.destPlayerY;
	startChangeRoom(_destRoom, _playerX, _playerY);
}

if (playerOWReadingText()) { 
	disableMovement();
	exit; 
} 


//---------- TEXT MENAGEMENT----------

checkingText();

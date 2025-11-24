if (room == Room_Battle) { exit; }

var key_right = keyboard_check(ord("D")); 
var key_left = keyboard_check(ord("A")); 
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

var key_rightPr = keyboard_check_pressed(ord("D")); 
var key_leftPr = keyboard_check_pressed(ord("A")); 
var key_upPr = keyboard_check_pressed(ord("W"));
var key_downPr = keyboard_check_pressed(ord("S"));

hsp = (key_right - key_left) * owSpd;
vsp = (key_down - key_up) * owSpd;

if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }

if (keyboard_check_pressed(vk_space)) { shading = true }

if (canMove == true) {
	if (key_upPr) { sprite_index = sPlayerOwBehind; playerFacing = PLAYER_FACING_CHECK.FACING_UP; }
	if (key_downPr) { sprite_index = sPlayerOwFront; playerFacing = PLAYER_FACING_CHECK.FACING_DOWN; }
	if (key_rightPr) { sprite_index = sPlayerOwRight; playerFacing = PLAYER_FACING_CHECK.FACING_RIGHT; }
	if (key_leftPr) { sprite_index = sPlayerOwLeft; playerFacing = PLAYER_FACING_CHECK.FACING_LEFT;}
	
	if (key_down) { sprite_index = sPlayerOwFront; image_speed = 1; }
	if (key_left) { sprite_index = sPlayerOwLeft; image_speed = 1; }
	if (key_up) { sprite_index = sPlayerOwBehind; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerOwRight; image_speed = 1; }

	if (place_meeting(x + hsp, y, oWall)) { hsp = 0; image_speed = 0; image_index = 0; } 
	if (place_meeting(x, y + vsp, oWall)) { vsp = 0; image_speed = 0; image_index = 0; } 
		
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
	stopMovement();
	exit; 
} 

//---------- TEXT MENAGEMENT----------

checkingText();

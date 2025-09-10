#macro A_LOT_OF_DAMAGE [350, ["*Your bones feel like\n crackers.", "*Your brains is\n probably hoinh\n to explode soon.", "*You are about to\n pass out from\n the blood loss."]]
#macro A_MEDIUM_DAMAGE [200, ["*Probably you just\n broke 3 bones.", "*Nothing that bad."]]
#macro A_LITTLE_DAMAGE [100, ["*Like the pain you\n knew as a kid with\n skinned knees."]]
#macro FLAWLESS [0, ["*Only the Best...", "*...the Perfect things...", "*INCREDIBLE;", "*FLAWLESS     "]]

enum TEXT_INDEXES {
	VALUE = 0,
	STRINGS = 1
}

function flavourPlayerHurt() {
	var _hurtVals = [A_LOT_OF_DAMAGE, A_MEDIUM_DAMAGE, A_LITTLE_DAMAGE, FLAWLESS];
	for (var i = 0; i < array_length(_hurtVals); i++) {
		if (oSoul.damageTaken >= _hurtVals[i][TEXT_INDEXES.VALUE]) {
			return 	_hurtVals[i][TEXT_INDEXES.STRINGS];
		}
	}
}

function shieldDestroyed() {
	if (global.playerShield <= 0) {
		return ["*You really like\n destroying things\n Uh?", "*You'd better not\n destroy your f*****g\n shield next time.", "*Dumb**s"];
	}
	return ["*Taking care of the\n that have been\n gifted to you...", "*Is the best\n feeling :)"];
}
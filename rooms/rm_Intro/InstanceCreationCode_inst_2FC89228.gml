var _faceRef = sFacialExpressionsVodoo;
playerShouldFace = PLAYER_FACING_CHECK.FACING_LEFT;

/*addCharacterPage("*Hello!", _faceRef, FACES.HAPPY);
addCharacterPage("*What is this\n new Place?", _faceRef, FACES.SAD);
addCharacterPage("*It seems like\n everything has\n changed...", _faceRef, FACES.SAD);
addCharacterPage("*At least, now I\n can appreciate this\n beatiful Sunset...", _faceRef, FACES.HAPPY);
addCharacterPage("*Wait...", _faceRef, FACES.SAD);
addCharacterPage("*Shouldn't I be\n burning by now?", _faceRef, FACES.ANGRY, TXT_ANIM.W_H_CHANGE);
addCharacterPage("*...", _faceRef, FACES.HIDDEN);
addCharacterPage("*Well, untill then, \n I'll keep staring at\n it.", _faceRef, FACES.HAPPY, TXT_ANIM.NOONE, startHandShakeTextMinigame);
*/

addCharacterPage("*Hello!\n*This is a WAVEY test!\n can u feel the curves?!", _faceRef, FACES.HAPPY, TXT_ANIM.WAVEY);
addCharacterPage("*THIS IS A SHAKY TEXT.\n*I'm gonna kill you...\n :))))", _faceRef, FACES.HAPPY, TXT_ANIM.SHAKY);
addMinigamePage(MINIGAMES.HAND_SHAKE);
addCharacterPage("*Eccotene un altro!", _faceRef, FACES.HAPPY, TXT_ANIM.NOONE);
addCharacterPage("*Eccotene un altro!", _faceRef, FACES.HAPPY, TXT_ANIM.NOONE);
addCharacterPage("*Eccotene un altro!", _faceRef, FACES.HAPPY, TXT_ANIM.NOONE);
addMinigamePage(MINIGAMES.HAND_SHAKE);
addCharacterPage("*Bravo!", _faceRef, FACES.HAPPY);
addCharacterPage("*Hai completato tutti i\n text minigames!", _faceRef, FACES.HAPPY);
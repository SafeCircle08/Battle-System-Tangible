var _faceRef = sFacialExpressionsVodoo;
playerShouldFace = PLAYER_FACING_CHECK.FACING_LEFT;

/*addCharacterPage("*Hello!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY);
addCharacterPage("*What is this\n new Place?", _faceRef, FACIAL_EXPRESSIONS.FACIAL_SAD);
addCharacterPage("*It seems like\n everything has\n changed...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_SAD);
addCharacterPage("*At least, now I\n can appreciate this\n beatiful Sunset...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY);
addCharacterPage("*Wait...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_SAD);
addCharacterPage("*Shouldn't I be\n burning by now?", _faceRef, FACIAL_EXPRESSIONS.FACIAL_ANGRY, TEXT_ANIMATIONS_FXS.TEXT_AN_W_H_CHANGE);
addCharacterPage("*...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HIDDEN_FACE);
addCharacterPage("*Well, untill then, \n I'll keep staring at\n it.", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, startHandShakeTextMinigame);
*/

addCharacterPage("*Ora provo a mettere\n il minigame dopo qua...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY);
addCharacterPage("*Minigame dopo questa\n pagina...", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS);
addMinigamePage(MINIGAMES.HAND_SHAKE);
addCharacterPage("*Eccotene un altro!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS);
addCharacterPage("*Eccotene un altro!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS);
addCharacterPage("*Eccotene un altro!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY, TEXT_ANIMATIONS_FXS.TEXT_NO_FXS);
addMinigamePage(MINIGAMES.HAND_SHAKE);
addCharacterPage("*Bravo!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY);
addCharacterPage("*Hai completato tutti i\n text minigames!", _faceRef, FACIAL_EXPRESSIONS.FACIAL_HAPPY);
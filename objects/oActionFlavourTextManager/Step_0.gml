text = oBattleManager.actionsFlavourText;

if (canCreateText() == false) {
	if (instance_exists(myTextInstance)) { instance_destroy(myTextInstance); }
	myTextInstance = undefined;
}

if (canCreateText() && myTextInstance == undefined) {
	myTextInstance = instance_create_layer(x, y, "Instances", oTextInstance);
	myTextInstance.text = text;
	myTextInstance.font = font;
	myTextInstance.character = false;
	myTextInstance.inBox = true;
	myTextInstance.inBattle = true;
	myTextInstance.isActionsFlavourText = true;
	myTextInstance.sound = sndBasicTxt5;
}
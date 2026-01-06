if (canCreateText() == false) {
	if (instance_exists(myTextInstance)) { instance_destroy(myTextInstance); }
	myTextInstance = undefined;
}

if (canCreateText() && myTextInstance == undefined) {
	myTextInstance = instance_create_layer(x, y, textLayer, oTextInstance);
	myTextInstance.text = text;
	myTextInstance.font = font;
	myTextInstance.character = character;
	myTextInstance.inBox = inBox;
	myTextInstance.inBattle = inBattle;
	myTextInstance.isActionsFlavourText = isActionFlavourText;
	myTextInstance.sound = sound;
}
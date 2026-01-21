text = undefined;
font = undefined;
character = undefined;
inBox = undefined;
inBattle = undefined;
isActionFlavourText = undefined;
sound = undefined;

poinDelay = 0;
commaDelay = 0;

textLayer = "Instances";

myTextInstance = undefined;

canCreateText = function() {}

createText = function() {
	myTextInstance = instance_create_layer(x, y, textLayer, oTextInstance);
	myTextInstance.text = text;
	myTextInstance.font = font;
	myTextInstance.character = character;
	myTextInstance.inBox = inBox;
	myTextInstance.inBattle = inBattle;
	myTextInstance.isActionsFlavourText = isActionFlavourText;
	myTextInstance.sound = sound;
	myTextInstance.commaDelay = commaDelay;
	myTextInstance.pointDelay = poinDelay;	
}
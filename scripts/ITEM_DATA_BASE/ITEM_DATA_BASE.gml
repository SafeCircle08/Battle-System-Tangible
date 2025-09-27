global.pizza = createNewItem("Pizza", sPizza, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("A slice of pepperoni pizza.", 200)],
	[fullHpMessage("That pizza was incredible!")],
	["You ate a slice of pizza! It was mid tho..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.kfc = createNewItem("KFC", sKfc, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Made in Kentucky with LOVE!", 150)],
	[fullHpMessage("Fried the right way!")],
	["You became a black ninja! How awesome isnt it"],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.candy = createNewItem("8Bit_C.", s8BitCandy, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_SPD, ITEM_PROPERTY_HACKER],
	[hpMessage("Great to fix code readability!", 200)],
	[fullHpMessage("You took one. You feel fine.")],
	["You took one candy... You would like to take more, but you can't..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.joice = createNewItem("Joice", sJoiceItem, 233, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	[hpMessage("JOICE, the juice made with joy!", 233)],
	[fullHpMessage("Drinking JOICE made your day better!")],
	["One sip of Joice is enough to make a grown man cry..."],
	method(self, function() { healPlayer(233, sndPlayerDrinkingHeal); }));

global.cyanide = createNewItem("CN-", sCyanideItem, -237, sndPlayerEatingHeal,
	[ITEM_PROPRTY_BIO_HAAZARD, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["A pill of cyanide. You would never eat this."],
	["There is no HP lol"],
	["Why did you do that like, are you stupid or what like idk..."],
	method(self, function() { hitPlayer(233); }));

global.honeyHoneyComb = createNewItem("HHComb", sHHComb, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	[hpMessage("A HoneyComb made of Honey", 150)],
	[fullHpMessage("That taste... Thank you Glucose for existing!")],
	["You ate the HHComb so quicly your hands got dirty."],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.painKiller = createNewItem("P.Kill", sPainKillerItem, 35, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Found by chance among some wraps.", 35)],
	[fullHpMessage("This Pill was enough to stop your pains")],
	["Your " + string(choose("stomach", "head", "leg", "back", "arms")) + " still hurts, but it's bearable."],
	method(self, function() { healPlayer(25, sndPlayerEatingHeal); }));

global.bandages = createNewItem("M.Wraps", sBandagesItem, 215, sndPlayerBasicHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DOUBLE_HEAL, ITEM_PROPERTY_ADD_TO_INV],
	[hpMessage("Bandages used to treat Injuries", 215)],
	[fullHpMessage("Your deepest wounds got healed")],
	["Cuts are less annoying if they are protected."],
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { addItemToInventory(global.painKiller); }));
	
global.mint = createNewItem("Dropint", sMintDrop, 75, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Gathered from pine drops.", 75)],
	[fullHpMessage("Fresh. Winter. Snow. Cold")],
	["Make sure not to drink fresh water in the next 5 minutes!"],
	method(self, function() { healPlayer(global.mint.hp, global.mint.outSound); }))
	
global.cocoMilk = createNewItem("C.Milk", sCocoMilk, 122, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_POISON, sSlownessProperty],
	[hpMessage("Gives a awesome feeling of fresh.", 122)],
	[fullHpMessage("This Milk refreshed you to the MAX!")],
	["This milk really gives you that summer feeling!"],
	method(self, function() { healPlayer(global.cocoMilk.hp, global.cocoMilk.outSound);}), 
	method(self, function() { setPlayerToPoisoned(3); }),
	method(self, function() { setPlayerToSlowness(2); }));

global.hotDogWater = createNewItem("H.Water", sHGWater, 115, sndPlayerDrinkingHeal, 
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_MIGHT_HURT, ITEM_PROPERTY_NOONE], 
	[hpMessage("Hot Dog flavoured Water. Yes, it is.", 115)],
	[fullHpMessage("Overall it wasn't that bad.")],
	["Ehw, you actually drunk that...?"],
	method(self, function() { healPlayer(115, sndPlayerDrinkingHeal); }),
	method(self, function() { mightHurt(3, 3); }));



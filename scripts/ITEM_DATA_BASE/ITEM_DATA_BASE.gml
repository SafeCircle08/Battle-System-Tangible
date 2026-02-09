function DEBUG_addCustomEnchList(_item, _enchList) {
	for (var i = 0; i < array_length(_enchList); i++) {
		_item.enchants[i] = _enchList[i];	
	}
	_item.enchanted = true;
}

function itemHeal(_item) { healPlayer(_item.hp, _item.outSound); }
function itemHit(_item) { hitPlayer(-_item.hp); }

function createProperty(_spr, _func) {
	return {
		sprite: _spr,
		func: _func
	}
}

function itemNooneProp() {
	return createProperty(sNooneProperty, function() {});
}
function propertyHeal() {
    return {
        sprite: sHealProperty,
        func: function(item) {
            itemHeal(item);
        }
    };
}
function propertyHit() {
	return {
		sprite: sBioHaazardProperty,
		func: function(item) {
			hitPlayer(-item.hp);	
		}
	}
}
function propertyDoubleHeal() {
	return {
		sprite: sDoubleHealProperty,
		func: function(item) {
			itemHeal(item);
			itemHeal(item);
		}
	}
}
function itemDefProp() {
	return createProperty(sDefenceProperty, function() {});
}
function itemAddToInvProp() {
	return {
		sprite: sAddToInvProp,
		func: function(item) {
			addItemToInventory(item.toAddItem);
		}
	}
}

#region ITEMS CREATED

global.candy = createItemEat("8Bit_C.", s8BitCandy, 200,
	itemInfoMessage("Great to fix code readability!", 200),
	fullHpOutMessage("You took one. You feel fine."),
	"One candy was enough to kill your urges to clean code!",
	propertyHeal());

global.painKiller = createItemEat("P.Kill", sPainKillerItem, 35,
	itemInfoMessage("Found by chance among some wraps.", 35),
	fullHpOutMessage("This Pill was enough to stop your pains"),
	"Your " + string(choose("stomach", "head", "leg", "back", "arms")) + " still hurts, but it's bearable.",
	propertyHeal());

global.bandages = createItemAddToInv(ITEM_TYPE.GENERIC, global.painKiller, "M.Wraps", sBandagesItem, 215,
	itemInfoMessage("Bandages used to treat Injuries", 215),
	fullHpOutMessage("Your deepest wounds got healed"),
	"Cuts are less annoying if they are protected.",
	propertyDoubleHeal(), itemAddToInvProp());

/*
global.joice = createNewItem("Joice", sJoiceItem, 233, sndPlayerDrinkingHeal,
	itemInfoMessage("JOICE, the juice made with joy!", 233),
	fullHpOutMessage("Drinking JOICE made your day better!"),
	"One sip of Joice is enough to make a grown man cry...",
	propertyHeal(), itemDefProp());

global.cyanide = createNewItem("CN-", sCyanideItem, -237, sndPlayerEatingHeal,
	"A pill of cyanide. You would never eat this.",
	"There is no HP lol",
	"Why did you do that like, are you stupid or what?.",
	propertyHit());  

/*
global.honeyHoneyComb = createNewItem("HHComb", sHHComb, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	itemInfoMessage("A HoneyComb made of Honey", 150),
	fullHpOutMessage("That taste... Thank you Glucose for existing!"),
	"You ate the HHComb so quicly your hands got dirty.",
	method(self, function() { itemHeal(global.honeyHoneyComb); }));
	
global.mint = createNewItem("Dropint", sMintDrop, 75, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	itemInfoMessage("Gathered from pine drops.", 75),
	fullHpOutMessage("Fresh. Winter. Snow. Cold"),
	"Make sure not to drink fresh water in the next 5 mins!",
	method(self, function() { itemHeal(global.mint); }))
	
global.cocoMilk = createNewItem("C.Milk", sCocoMilk, 122, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	itemInfoMessage("Gives a awesome feeling of fresh.", 122),
	fullHpOutMessage("This Milk refreshed you to the MAX!"),
	"This milk really gives you that summer feeling!",
	method(self, function() { itemHeal(global.cocoMilk); }));

global.hotDogWater = createNewItem("H.Water", sHGWater, 115, sndPlayerDrinkingHeal, 
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_MIGHT_HURT, sSlownessProperty], 
	itemInfoMessage("Hot Dog flavoured Water. Yes, it is.", 115),
	fullHpOutMessage("Overall it wasn't that bad."),
	"Ehw, you actually drunk that...?",
	method(self, function() { itemHeal(global.hotDogWater); }),
	method(self, function() { mightHurt(3, 3); }),
	method(self, function() { setPlayerToSlowness(SEGNALINO_LEVEL.LEVEL_2); }));

global.cheeseCake = createNewItem("Ch.Cake", sCheeseCakeItem, 300, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	itemInfoMessage("Traditional Sunday Dessert.", 300),
	fullHpOutMessage("That was so fucking good TwT"),
	"The Dessert of Desserts.",
	method(self, function() { itemHeal(global.cheeseCake); }))

global.soup = createNewItem("Soup", sSoup, 450, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_WARM_HEAL, ITEM_PROPERTY_NOONE],
	itemInfoMessage("Warmed you up in the inside", 450),
	fullHpOutMessage("real"),
	"How can it still be that hot???",
	method(self, function() { itemHeal(global.soup); }),
	method(self, function() { warmUpPlayer(); }));
	method(self, function() { setPlayerToIceSlide(SEGNALINO_LEVEL.LEVEL_3); })
*/

#endregion

//DEBUG_addCustomEnchList(global.soup, [ENCHANT_GOLDY, ENCHANT_GOLDY, sNoEnchants]);

//putItemsInInventory(MAX_ITEMS_NUM);

fillInventory();
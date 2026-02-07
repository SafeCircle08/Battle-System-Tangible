//In this script you set up the functions that a specific
//action has.

//To build the actual function go to: 
// define_player_main_actions -> for main actions
// define_player_sub_actions  -> for sub actions


#macro GET_INPUTS true
#macro DONT_GET_INPUTS false
#macro CAN_NAVIGATE true
#macro CANT_NAVIGATE false

#macro INVENTORY_X room_width / 2 - 80 - (59)
#macro INVENTORY_Y room_width / 2 - 55

function createAnimationObject(sprite, _messages, _method = function() {})
{
	if (!instance_exists(fadeInOutAnimationsParent))
	{
		var _myEffect = instance_create_layer(0, 0, LAYER_EFFECT, fadeInOutAnimationsParent);
		_myEffect.sprite_index = sprite;
		_myEffect.messages = _messages;
		_myEffect.myMethod = _method;
	}
	return;
}

function initializeNavigatingBattleOptionFunctions() {
	selectedBattleOption = function() { 
		selectAction(true, true);
		if (!instance_exists(oSubMenuManager)) { instance_create_layer(x, y, "Instances", oSubMenuManager); } 
		else { oSubMenuManager.setTofadeIn(); }
	}
	
	navigatingSubMenuFunction = function() {
		showMirrors();
		easeInBg();
		var _subManager = instance_find(oSubMenuManager, instance_number(oSubMenuManager) - 1);
		if (cancelPressed()) { 
			_subManager.setToFadeOut();
			resetNavigation(0); 
		}
	}
}

function initialiseCryOptionFunction() {
	selectedCryOption = function() { selectAction(true, false, sndSelecting_2, ["<>Crying won't do nothing\n  but dehydratate you to death.", "\n<>Stop it."]); }		
}

function initializeInventoryOptionFunctions() {
	#region	 drawStatistics()
	
	/*
		Draw the statistics for each item
		[property, property, property]
	*/
	
	drawStatistics = function(_index, _itemSprX, _itemSprY, _border) {
		var _item = global.equippedItems[_index];
		for (var k = 0; k < MAX_PROPERTIES_NUMBER; k++) {	
			draw_sprite(_item.propertiesList[k], 0, _itemSprX - _border - 1 + inventoryXAdder, _itemSprY + (10 * k + (1 * k)));	
		}	
	}
	#endregion
	
	#region drawEnchants()	
	
	/*
		Draws the enchants that are actually
		applied to the item
	*/
	
	drawEnchants = function(_index, _itemSprX, _itemSprY, _border) {
		var _item = global.equippedItems[_index];
		var _enchantsN = array_length(_item.enchants);
		var _itemSprW = sprite_get_width(sBandagesItem);
		for (var k = 0; k < MAX_ENCHANTS_PER_ITEM_NUM; k++) {
			if (k < _enchantsN) {
				setGlintShader();
				var _enchSpr = _item.enchants[k].sprite;
				draw_sprite(_enchSpr, 0, _itemSprX + _itemSprW + 1 + inventoryXAdder, _itemSprY + (10 * k + (1 * k)));
				shader_reset();
				continue;
			}
			else { 
				draw_sprite(
					sNoEnchants, 0, 
					_itemSprX + _itemSprW + 1 + inventoryXAdder, 
					_itemSprY + (10 * k + (1 * k))
				); 
			}
		}
	}
	
	#endregion
	
	#region setEnchantText()
	setEnchantTextCol = function(_index, _col = c_purple) {
		if (selected_option != _index) { draw_set_color(_col); }
		setGlintShader();
	}
	#endregion
	
	#region thisItemIsSelected()
	thisItemIsSelected = function(_index) {
		return (selected_option == _index) && (!instance_exists(itemOutputMessage)) 	
	}
	#endregion
	
	#region createOutPutMessage
	
	/*
		Creates the output message when 
		an item is consumes
	*/
	
	createOutPutMessage = function() {
		var _border = 10;
		var _sprBG = setToGuiBgSelectedTheme();
		var _bgH = sprite_get_height(_sprBG) * 2;
		
		var _x = INVENTORY_X + _border + inventoryXAdder;
		var _y = INVENTORY_Y + (_bgH / 2) + _border / 2;
		var _depth = 500;
		
		itemOutputMessage = instance_create_depth(_x, _y, _depth, oInventoryText);
		itemOutputMessage.actualArray = usingItem(selected_option);
		itemOutputMessage.visible = true;
		itemOutputMessage.textDelay = 30;
	}
	#endregion
	
	#region selectedInventoryOption()
	
	/*
		When you select the option
		from the main battle menu
	*/
	
	selectedInventoryOption = function() {
		if (playerHasItems()) {
			selectAction(true, true, sndOpeningInventory, [], method(self, function() {
				showCursor();
				selected_option = 0;
				playingGuiAnimation = true; 
			}));
		}
		else { 
			setMonologueTextToNewString(["*Cannot open the inventory\n right now...", "*You don't have any\n Items."]);
			resetNavigation(3, undefined, method(self, function() { moreStepsAct = true; })); 
		}
	}
	#endregion
	
	#region invHandleNavigation()
	invHandleNavigation = function(_canNavigate) {
		if (!instance_exists(itemOutputMessage) && (_canNavigate)) { 
			var _itemsNumber = array_length(global.equippedItems); 
			navigatingBattle(0, _itemsNumber - 1); 
		}		
	}
	#endregion
	
	#region invHandleConfirmation()
	invHandleConfirmation = function(_getInputs) {
		if (_getInputs) { 
			if (cancelPressed()) && (!instance_exists(itemOutputMessage)) { 
				resetNavigation(3, sndClosingInventory); 
			} 
			
			takenOptionDelay = setTimer(takenOptionDelay);
			if (takenOptionDelay == 0) {
				if (confirmPressed()) { 
					if (instance_exists(itemOutputMessage)) { 
						instance_destroy(itemOutputMessage);
						terminateAction(["*Finished Using the\n Inventory!"]);
					} else { createOutPutMessage(); }
				}
			}
		}		
	}
	#endregion
	
	#region MAIN INVENTORY FUNCTION
	navigatingInventoryFunction = function(_getInputs = GET_INPUTS, _canNavigate = CAN_NAVIGATE) {
		easeInBg();
		invHandleNavigation(_canNavigate);
		invHandleConfirmation(_getInputs);
		
		//Only for debugging
		if (keyboard_check_pressed(ord("V"))) { enchantItem(global.equippedItems[selected_option]); }
		if (keyboard_check_pressed(ord("O"))) { disenchantItem(global.equippedItems[selected_option]); }
	}
	#endregion
}
function initializeHealCheatFunction(){
	selectedHealCheatOption = function() { terminateAction(["Player healed himself!!!"], method(self, function() { global.playerHP += 1; })) }	
}
function initializeAttackFunctions() {
	selectedAttackFunction = function() { 
		selectAction(false, false); 
	}
	
	attackFunction = function() {
		hideMirrors();
		easeInBg(1);
		
		//TIMER DEL PLAYER (PER QUANTI FRAME PUO' ATTACCARE)
		global.playerAttackTime++;
	
		//CREATING THE ATTACK BAR
		var _padX = room_width / 2;
		var _padY = room_width / 2 - 75;
		var eqDrumP = global.eqDrumPad;
		var eqSc = global.eqScope;
		//CREO GLI OGGETTI 
		if (global.playerAttackTime == 1) {
			instance_create_layer(_padX, _padY, "Instances", oDrumPadBase);
			instance_create_layer(_padX, _padY, LAYER_BULLETS, eqDrumP);
			instance_create_layer(_padX, _padY, LAYER_SCOPE, eqSc);
		}			
		
		//SE IL PLAYER NON SPARA IN TEMPO
		if (global.playerAttackTime >= global.playerAttackTimer) {
			terminateAction(
				global.playerOptions.attack_function._failedAttackFlavourText,
				method(self, function() {
			        oDrumPadObjectsParent.reduceDimensionsAlpha = true;
			        global.playerAttackTime = 0;	
				})
			);
			return;
		}
		else {
			if (instance_number(oShell) == 0) {
				//TODO:
				/*	
					Da fare che alla fine dei colpi,
					Vengono mostrate degli "attacchi" addosso all'enemy,
					e quando concludono quelle,
					//Il turno del player effettivamente finisce e viene
					mostrato il danno nel player
				*/
				////////
				var _dmg = string(global.eqDrumPad.damage);
				
				terminateAction(
					global.playerOptions.attack_function._flavourText,
					method(self, function() {
						var _dmg = string(global.eqDrumPad.damage);
						addNewActionFlavourTextPage("Damage dealt: " + _dmg, "!");
						oDrumPadObjectsParent.reduceDimensionsAlpha = true;
						global.playerAttackTime = 0;
					})
				);
			}
			return;
		}
	}	
}
function initializeUnbindFunctions() {
	selectedUnbindCage = function() { selectAction(false, false, undefined, [], method(self, function() { unbinding = true; instance_destroy(oMirrorTargeting); }))}
	unbindFunction = function() {
		terminateAction(
			global.playerOptions.unbind_function._flavourText,
			method(self, function() {
				global.CSvalue -= 10;	
			})
		);
	}	
}
function initializeDefenceFunctions()
{
	selectedDefenceFunction = function() { selectAction(false, false, undefined, [], method(self, function() { hideMirrors(); }))}
	defenceFunction = function() {
		createAnimationObject(sUmbrellaEffectGUI, ["<>You decided to defend!"],
				method(self, function() { defended = true; }));
	}
}
function initializePrayFunctions()  {
	
	createAdDeco = function() {
		var _downAds = instance_create_layer(x, y, layer, oAdSlidingManager);
		_downAds._sign = 1;
		_downAds.createVerticalAds();
		var _upAds = instance_create_layer(x, y, layer, oAdSlidingManager);
		_upAds._sign = -1;
		_upAds.xPos = room_width - (sprite_get_width(sPizzaAd));
		_upAds.createVerticalAds();			
	}
	
	selectedPrayOption = function() { 
		selectAction(true, true, undefined, ["*You decided to pray."], method(self, function() { inventoryAlpha = 0; }));
		
		if (!instance_exists(oAdSlidingManager)) { createAdDeco(); }	
	}
	
	#region	PRAY FUNCTIONS
	notAcceptedPrayFunc = function() {
		var _dmg = irandom_range(20, 167);
		fadeInOutAnimationsParent.messages = 
		["*Your pray wasn't accepted...", "*You lost " + string(_dmg) + " HPs..."]; 
		hitPlayer(_dmg);	
	}
	acceptedPrayFunc = function() {
		var _heal = irandom_range(150, 300);
		fadeInOutAnimationsParent.messages = 
		["*Gained " + string(_heal) + " HPs!"];
		if (global.playerHP + _heal >= global.playerMAX_HP) { 
			array_push(fadeInOutAnimationsParent.messages, "*HP MAXED OUT!")
		}
		healPlayer(_heal, sndPlayerBasicHeal);		
	}
	addToInvPrayFunc = function() {
		fadeInOutAnimationsParent.messages = addItemToInventory();
	}
	removeAllSegnaliniPrayFunc = function() {
		if (playerIsUnderSegnaliniEffects()) {
			addNewActionFlavourTextPage("You are MISERABLE", "!");
			addNewActionFlavourTextPage("So we decided to\n remove all bad\n effects applied to you", "!");
			addNewActionFlavourTextPage("You can Thanks us later", "!");
			removeSegnalini(false);
		} else {
			fadeInOutAnimationsParent.messages = [
				"*We tried to remove negative\n effects from you.",
				"*But you are already\n so COOL!",
				"*So, yeah, you don't\n need our help!",
				"*At least untill you\n are not bleeding from\n your ears!",
				"*Bye bye!"
			];
		}
	}
	#endregion
	
	prayOption = function() { 
		createAnimationObject(sSendYourPrayAnimation_good, [],
		method(self, function() {
			var _possPrayFuncs = [
				notAcceptedPrayFunc, 
				acceptedPrayFunc, 
				addToInvPrayFunc,
				removeAllSegnaliniPrayFunc
			];
			var _index = arrayGetValidIndex(_possPrayFuncs);
			var _choosedPrayFunc = _possPrayFuncs[_index];
			_choosedPrayFunc(); 
		}));
	}
}

function initializeEnchantingFunctions() {
	selectedEnchantOption = function() { 
		selectAction(true, true, undefined, ["*You enchanted an Item.","*You'll be able\n to use it next turn."]);
		showCursor();
		if (!instance_exists(oEnchantOptionManager)) { instance_create_layer(x, y, "Instances", oEnchantOptionManager); } 
		else { oEnchantOptionManager.setTofadeIn(); }
	}
	
	enchantingOption = function() {
		easeInBg();
		var _enchantManager = instance_find(oEnchantOptionManager, instance_number(oEnchantOptionManager) - 1);
		
		if (cancelPressed()) {
			if (_enchantManager.showingInv == false) {
				_enchantManager.setToStartStateItemVars();
				_enchantManager.setToFadeOut();
				resetNavigation(1); 				
			} else {
				_enchantManager.showingInv = false; //doesnt call the invFunc anymore
				goToPreviousOption(method(self, function() { 
					oEnchantOptionManager.setToStartStateItemVars();
				}));					
			}
		}

		takenOptionDelay = setTimer(takenOptionDelay);
		if (takenOptionDelay == 0) {
			if (confirmPressed(false)) && (_enchantManager.placedItem == undefined) { 
				if (playerHasItems()) {
					setSelectionDelay();
					if (_enchantManager.showingInv == false) { 
						selected_option = 0; 
						_enchantManager.showingInv = true; 
					}
				} else { setMonologueTextToNewString(["*Can't Enchant any Item.\n*(Inventory Empty)\n *So [___] angry!"]); }
			}
		}
	}
	
}

function initializeAllCreatedFunctions() {
	initializeNavigatingBattleOptionFunctions();
	initialiseCryOptionFunction();
	initializeInventoryOptionFunctions();
	initializeHealCheatFunction();
	initializeAttackFunctions();
	initializeUnbindFunctions();
	initializeDefenceFunctions();
	initializePrayFunctions();
	initializeEnchantingFunctions();
}
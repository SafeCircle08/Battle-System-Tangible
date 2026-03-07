//Initialize function

function addAsPage(_text) {
	var _page = {
		contents: _text,
		faceSprRef: noone,
		expression: noone,
		effect: TEXT_ANIMATIONS_FXS.TEXT_NO_FXS,
		destroyPageFunc: function() {},
		color: setToGuiTextColorSelectedTheme()
	}
	return _page;
}

function steamPunkEnemyBattleInfo() {
	#region DIALOGUE
	//Dialogue list
	var steamEnemyText = [
		[
			addAsPage("This new text\nsystem is\nawesome!111"), 
			addAsPage("Now, I can\neven have\nfaces!222")
		],
		[
			addAsPage("This new text\nsystem is\nawesome!333"), 
			addAsPage("Now, I can\neven have\nfaces!444")
		],
		[
			addAsPage("This new text\nsystem is\nawesome!555"), 
			addAsPage("Now, I can\neven have\nfaces!666")
		],
		[
			addAsPage("This new text\nsystem is\nawesome!777"), 
			addAsPage("Now, I can\neven have\nfaces!888")
		],

		setEnemyBattlePage(
			["This is so cool!"]
		),
		setEnemyBattlePage(
			["Really, I'm not\njoking actually."]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),
		setEnemyBattlePage(
			["If only I\nhad other\ndifferent faces...", "It is going\nto happen soon!"]
		),	
	];
	
	#endregion
	#region BULLET PATTERNS
	var steamPunkBulletGenerator = [
		oEmpyTurn,
		oSteamPunkMaskIdle, //
		oSteamPunkMaskIdle, //
		oSteamPunkMaskIdle, //
		oBallAttack, //
		oSpikeUpBulletGen, //
		oKnifeBulletGen, //
		oDocumentBulletGen, //
		oCrossSwordsBulletGen, //5 //
		oKnifeGenerator, //
		oKnifeGenerator_FAST, //
		oAllDirectionSteamGen,  //
 		oRobotsToolGen,  //10 //
		oEmpyTurn, //-------------------- //
		oChemistryGenerator, //
		oSawsBulletGen, //
		oSawsBulletGen, //
		oPressureElectronGen, //15 //
		oBlasterFreeGen, //
		oStereoGen, //
		oBgScrolling,
		oEmpyTurn,
	];
	#endregion
	#region	FLAVOUR TEXTS 
	var steamPunkBattleFlavourTexts = [
		[
			addAsPage("*The heat in the room is\n starting to become\n impossible to manage..."), 
			addAsPage("*You should end this as\n fast possible...\n*Oh, get some Water too!")
		],
		[
			addAsPage("*Everyone thinks Hell looks\n like this."), 
			addAsPage("*Hell is prolly less\n warm than this\n f*****g place.")
		],
		[
			addAsPage("*It smells like burned brain\n && failed equations..."), 
			addAsPage("*Do equations even have\n a smell?")
		],
		[
			addAsPage("*I can't wait for Winter\n to come."),
			addAsPage("*Dark Afternoons,\n\n*(very dark afternoons)"),
			addAsPage("*Cozy Blankets,\n\n*(cozy, cozy)"), 
			addAsPage("*Hoodies...\n\n*(Nirvana Ones...)"), 
			addAsPage("*How Isn't that the best of\n feelings?")
		],
		[
			addAsPage("*SteamPunk is sitting in\n the Distance."),
			addAsPage("*He has a confused look\n on his Face."),
			addAsPage("*Or rather..."),
			addAsPage("*His Mask.")
		]
	]
	#endregion
	
	global.monsterHP = 1500;
	global.maxMonsterHp = 1500;
	global.monsterDamage = 1;
	global.enemyTimer = 0;
	global.textList = steamEnemyText;
	global.inUseGenerator = steamPunkBulletGenerator;
	global.battleFlavourTexts = steamPunkBattleFlavourTexts;
	global.enemyPortrait = setToGuiEnemyPortraitSelectedTheme();
}
function addTextAsPage(_text) {
	var _page = createPageBasic(
		_text, noone, noone,
		TXT_ANIM.NOONE, 
		function() {}, 
		setToGuiTextColorSelectedTheme(), 
		false,
		MINIGAMES.NOONE
	);
	return _page;
}

function addTextAsPageFx(_text, _fx) {
	return createPageBasic(_text, noone, noone, _fx);
}

function steamPunkEnemyBattleInfo() {
	#region DIALOGUE
	//Dialogue list
	var steamEnemyText = [
		[
			addTextAsPage("This new text\nsystem is\nawesome!111"), 
			addTextAsPage("Now, I can\neven have\nfaces!222")
		],
		[
			addTextAsPage("This new text\nsystem is\nawesome!333"), 
			addTextAsPage("Now, I can\neven have\nfaces!444")
		],
		[
			addTextAsPage("This new text\nsystem is\nawesome!555"), 
			addTextAsPage("Now, I can\neven have\nfaces!666")
		],
		[
			addTextAsPage("This new text\nsystem is\nawesome!777"), 
			addTextAsPage("Now, I can\neven have\nfaces!888")
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
			addTextAsPageFx("*The heat in the room is\n starting to become\n impossible to manage...", TXT_ANIM.WAVEY),
			addTextAsPageFx("*You should end this as\n fast possible...\n*Oh, get some Water too!", TXT_ANIM.WAVEY),
			addTextAsPageFx("*WHY DIDN'T I FUCKING\n STAY AT HOME...", TXT_ANIM.SHAKY),
			addTextAsPage("*I hate It here.....\n .................\n ..............."),
			addTextAsPageFx("*..........................\n ..........................\n ..........................", TXT_ANIM.WAVEY),
		],
		[
			addTextAsPage("*Everyone thinks Hell looks\n like this."), 
			addTextAsPage("*Hell is prolly less\n warm than this\n f*****g place.")
		],
		[
			addTextAsPage("*It smells like burned brain\n && failed equations..."), 
			addTextAsPage("*Do equations even have\n a smell?")
		],
		[
			addTextAsPage("*I can't wait for Winter\n to come."),
			addTextAsPage("*Dark Afternoons,\n\n*(very dark afternoons)"),
			addTextAsPage("*Cozy Blankets,\n\n*(cozy, cozy)"), 
			addTextAsPage("*Hoodies...\n\n*(Nirvana Ones...)"), 
			addTextAsPage("*How Isn't that the best of\n feelings?")
		],
		[
			addTextAsPage("*SteamPunk is sitting in\n the Distance."),
			addTextAsPage("*He has a confused look\n on his Face."),
			addTextAsPage("*Or rather..."),
			addTextAsPage("*His Mask.")
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
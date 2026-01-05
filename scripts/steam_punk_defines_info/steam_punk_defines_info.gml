//Initialize function
function steamPunkEnemyBattleInfo() {
	#region DIALOGUE
	//Dialogue list
	
	/*
	
	steamPunkText = 
	[
		[
			["Text", "Text", ..., "Text"],
			[face1, face2, ..., faceN]
		],
		[
			["Text", "Text", ..., "Text"],
			[face1, face2, ..., faceN]
		],
	]
	*/
	
	var steamEnemyText = [
		setEnemyBattlePage(
			[ "This new text\nsystem is\nawesome!", "Now, I can\neven have\nfaces!" ]
		),
		setEnemyBattlePage(
			["This is so cool!"]
		),
		setEnemyBattlePage(
			["Really, I'm not\njoking actually."]
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
			"*The heat in the room is\n starting to become\n impossible to manage...", 
			"*You should end this as\n fast possible...\n*Oh, get some Water too!"
		],
		[
			"*Everyone thinks Hell looks\n like this.", 
			"*Hell is prolly less\n warm than this\n f*****g place."
		],
		[
			"*It smells like burned brain\n && failed equations...", 
			"*Do equations even have\n a smell?"
		],
		[
			"*I can't wait for Winter\n to come.",
			"*Dark Afternoons,\n\n*(very dark afternoons)",
			"*Cozy Blankets,\n\n*(cozy, cozy)", 
			"*Hoodies...\n\n*(Nirvana Ones...)", 
			"*How Isn't that the best of\n feelings?"
		],
		[
			"*SteamPunk is sitting in\n the Distance.",
			"*He has a confused look\n on his Face.",
			"*Or rather...",
			"*His Mask."
		]
	]
	#endregion
	#region PORTRAITS
	var _portraits = loadEnemyPortrtaitsThemes(
		sGUI_SteamPunkMiniPortrait_ORANGE,
		sGUI_SteamPunkMiniPortrait_NIGHT_VISION
	);
	#endregion
	
	global.monsterHP = 1500;
	global.maxMonsterHp = 1500;
	global.monsterDamage = 1;
	global.enemyTimer = 0;
	global.textList = steamEnemyText;
	global.inUseGenerator = steamPunkBulletGenerator;
	global.battleFlavourTexts = steamPunkBattleFlavourTexts;
	global.enemyPortrait = _portraits[global.portraitIndex];
}
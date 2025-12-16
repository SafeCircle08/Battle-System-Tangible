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
	
	var steamEnemyText =
	[
		[
		// "AAAnnnnd, I have\nchanged my Font\nagain...",
		 //"Is this better???\nPLEASE!\nYou have to\ntell me!",
		 //"#Loading\n packages...",
		 //"std::cout <<\n 'FINALLY' \n<< std::endl;",
		 //"I've finally\nobtained a\nvoice!",
		// "You can't\nunderstand for\nhow long I've\nbeen waiting!",
		// "I should\nprobably call\nmy BOSS, my\nRobots, my-",
		// "...",
		// "You know what?",
		// "Let's not tell\nanything to BOSS",
		// "He'd probably\nstart some\nkind of\nbusiness on ts",
		// "&&",
		 "I hate\n my boss!\n  => (LOL)",
		],
		[
			"This is very\nannoying\nnot gonna lie.",   
			"Like, can you\nbelieve it?",
			"I have to do all\nof this just\nbecause text can't\nbe scaled."
		],
		[
			"The BOSS will\nfinally\nunderstand my\nimportance!",
			"I'll finally be\nconsidered as\nan INNOVATOR!",
			"FOREVER."
		],
		[
			"And, please...",
			"Don't think\nthat I like\ndoing this to you.",
		],
		["My will is\nagainst what\nI HAVE to do."],
		[
			"So now i have a new font\nuh?\nWell, if this is so,\ni'll make the\ncreator very very HAPPY!",
			"You are just..."
		],
		["Victim of your own fate."],
		["Damn this is starting to get dramatic, isn't it?"],
		[
			"Now let me think of a way in wich i could cheer you up...",
			"...",
			"...",
			"Oh yeah!",
		],
		["I've finally understood PHOTOSINTESIS."],
		[
			"Uh?",
			"You really don't know what it is about?",
		],
		[
			"Ill write that down later...",
			"maybe."
		],
		[
			"Oh my God why are you still fighting?",
			"Won't you just...",
			"... give up...?",
		],
		[
			"I'm starting to get very paranoid,,,,",
			"but at least im not an Android!",
		],
		[
			"sigh...",
			"I think it's time for my final attack.",
			"In which i've worked very hard!",
			"And i'am sure this is going to finally Defeat YOU!"
		],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
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
	var _portraits = [
		sSteamPunkMiniPortrait_DEFAULT,
		sSteamPunkMiniPortrait
		//others
	];
	#endregion
	
	global.monsterHP = 1500;
	global.maxMonsterHp = 1500;
	global.monsterDamage = 1;
	global.enemyTimer = 0;
	global.textList = steamEnemyText;
	global.inUseGenerator = steamPunkBulletGenerator;
	global.battleFlavourTexts = steamPunkBattleFlavourTexts;
	global.enemyPortrait = _portraits[global.styleSelection];
}
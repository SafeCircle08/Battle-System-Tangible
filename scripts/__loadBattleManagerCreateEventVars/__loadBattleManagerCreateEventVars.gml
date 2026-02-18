function __loadBattleManagerCreateEventVars(){
	with (oBattleManager) {
		layers = ["LoopBg_1", "LoopBg_2"];

		flavourTextIndex = 0;
		actionsFlavourText = [];
		showingExtraMonologueText = false;
		battleFlavourText = global.battleFlavourTexts[flavourTextIndex];

		hasEnemyIntro = false;
		enemyIntroDone = false;
		enemyIntroText = [];
		enemyWillTalkAfterBulletHellSection = false;

		global.borderWidth = 100;
		global.borderHeight = 100;

		turnNumber = 0;
		defended = false;
		playerDeath = false;
		playerTurn = true;

		moreStepsAct = false;
		decidingSubAction = false;
		selected_option = 0;

		shieldBarW = 121;
		hpbarW = 121;

		showActionsFlavourText = false;
		enemyTextShowed = false;
		enemyCanShowText = false;
		playerHpTextColor = c_white;

		startButtonXRef = -200;
		startButtonX = startButtonXRef;
		buttonFrame = 0;
		btTextWrote = false;

		takenOptionDelay = 3;
		itemOutputMessage = undefined;

		battleDelay = 3;
		actualDrawAlpha = 0;

		objsCreated = false;

		subMenuX = 0;
		subMenuY = 0;
		mainPressed = 0;
		lastPressed = 0;

		playingGuiAnimation = false;
		showingSubSubWindow = false;
		actionChoosen = false;
		showingSubWindow = false;
	}
}
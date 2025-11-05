function initSegnalinoCard(_segInst) {
	with (_segInst) {
		if (createdCard != undefined) { removeSegnalinoCard(); }
		addSegnalinoCard();
		createdCard.cardSetValues();
		//printSegnalinoInfos();	
	}
}
function loadPlayerStateInfo() {	
	global.playerStateFree     = createNewPlayerStateInfo(oSoul.stateFree,
					             sPlayerFreeState, sNoEffects, 0, "Up", 0, 0, 0, 0);
	
	global.playerStateMirrored = createNewPlayerStateInfo(oSoul.stateMirrored, sPlayerReversed, 
								 sInvertedEffect, 0, "Up", 0, 0, 0, 0);
	
	global.playerStateGravity  = createNewPlayerStateInfo(oSoul.stateGravity, sPlayerJump, 
								 sEffectGravity, 0, "Up", 0, 0, 0, 0);

	global.playerStateSpider   = createNewPlayerStateInfo(oSoul.stateSpider, sPlayerSpider, 
							     sSpiderEffect, 0, "Up", 0, -5, 0, 0);
	
	global.playerUsingUmbrella = createNewPlayerStateInfo(oSoul.stateGravity, sPlayerUmbrella, 
							     sUmbrellaEffect, 0, "Up", 0, 0, 0, 0);
								 
	global.playerStateCart	   = createNewPlayerStateInfo(oSoul.stateSliding, sPlayerSliding, 
								 sEffectGravity, 0, "Up", 0, 0, 0, 0);
								 
	global.playerStateCircuit  = createNewPlayerStateInfo(oSoul.stateCircuit, sPlayerCircuit, 
								 sPlayerCircuit, 0, "Up", 0, 0, 0, 0);
}
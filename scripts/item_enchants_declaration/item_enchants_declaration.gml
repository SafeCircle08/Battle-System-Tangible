#macro ENCHANT_SPRITE 0
#macro ENCHANT_FUNCTION 1


function itemEnchantsDeclaration()
{
	#macro ENCHANT_GOLDY [sGoldyEnchProperty, goldifier]
	#macro ENCHANT_OVER_TIME_HEAL [sOverTimehealEnchProperty, overTimeHeal]
	#macro ENCHANT_NIGHT_VISION [sNightVisionEnchProperty, setToNightVision]
}

global.enchantsInGame = [
	ENCHANT_GOLDY,
	ENCHANT_OVER_TIME_HEAL,
	ENCHANT_NIGHT_VISION
];
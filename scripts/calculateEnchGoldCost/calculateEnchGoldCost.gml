#macro BASE_ENCH_COST 100
#macro MAC_ENCH_COST 99999

function calculateEnchGoldCost(_enchLV) {
	var _enchGoldCost;
	_enchGoldCost = (BASE_ENCH_COST * _enchLV) * 8;
	_enchGoldCost += irandom_range(BASE_ENCH_COST - 20, BASE_ENCH_COST * 2);
	return _enchGoldCost;
}
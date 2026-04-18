function removeEnchant(_item, _enchIndex) {
	var _changedItem = variable_clone(_item);
	array_delete(_changedItem.enchants, _enchIndex, 1);
	playSound(sndDisenchanting, SOUND_CHANNEL_2);
	if (!hasEnchants(_changedItem)) _changedItem = setItemToNotEnchantedState(_changedItem);
	return _changedItem;
}
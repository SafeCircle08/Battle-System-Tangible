function loadItemSavedEnchantments(section, item) {
	for (var j = 0; j < MAX_ENCHANTS_PER_ITEM_NUM; j++) {
		var _enchkey = FILE_ITEM_ENCH_KEY + string(j) + ":";
		if (!ini_key_exists(section, _enchkey)) { break; }
			
		var _enchIdStr = ini_read_string(section, _enchkey, "");
		var _toAddEnch = global.enchantsById[? _enchIdStr];
		
		item.enchants[j] = _toAddEnch;
		setItemToEnchantedState(item);
	}		
}

function getSavedItem(section) {
	var idStr = ini_read_string(section, FILE_ITEM_ID_KEY, "");
	var toLoadItem = global.itemsById[? idStr];
	var item = variable_clone(toLoadItem);
	return item;
}



function loadItemsSimple() {
    if (!file_exists(FILE_NAME_ITEMS)) { return; }
    
    emptyInventory();
    ini_open(FILE_NAME_ITEMS);
    
	var i = 0;
	while (true) {
	    var section = FILE_ITEM_SECTION + string(i);
	    if (!ini_key_exists(section, FILE_ITEM_ID_KEY) || !ini_section_exists(section)) { break; }
		
		var item = getSavedItem(section);
		loadItemSavedEnchantments(section, item);
		addItemToInventory(item);
		
	    i += 1;
	}
    ini_close();
}
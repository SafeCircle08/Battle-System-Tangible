function loadItemsSimple() {
    if (!file_exists(FILE_NAME_ITEMS)) { return; }
    
    global.equippedItems = [];
    ini_open(FILE_NAME_ITEMS);
    
	var i = 0;
	while (true) {
	    var section = FILE_ITEM_SECTION + string(i);
	    if (!ini_key_exists(section, FILE_ITEM_ID_KEY) || !ini_section_exists(section)) { break; }
		
		var item;
		var idStr = ini_read_string(section, FILE_ITEM_ID_KEY, "0");
		var toLoadItem = global.itemsById[? idStr];
		item = variable_clone(toLoadItem);
		global.equippedItems[i] = item;
		
		//Saving the enchants the player put into the items
		for (var j = 0; j < MAX_ENCHANTS_PER_ITEM_NUM; j++) {
			if (!ini_key_exists(section, "Enchant " + string(j) + " spr")) { break; }
			setItemToEnchantedState(item);
			var _enchantSprAssetIndex = ini_read_string(section, "Enchant " + string(j) + " spr", "0");
			var _enchantFuncAssetIndex = ini_read_string(section, "Enchant " + string(j) + " func", "0");
			
			item.enchants[j][ENCHANT_SPRITE] = asset_get_index(_enchantSprAssetIndex); 
			item.enchants[j][ENCHANT_FUNCTION] = asset_get_index(_enchantFuncAssetIndex);
		}
	    i += 1;
	}
    ini_close();
}
#macro FILE_NAME_ITEMS "items.ini"
#macro FILE_ITEM_ID_KEY "Item_Id"
#macro FILE_ITEM_SECTION "Id for equipped Item N. "
#macro FILE_ITEM_ENCH_KEY "Enchant n."

function saveItems() {
	if (file_exists(FILE_NAME_ITEMS)) { file_delete(FILE_NAME_ITEMS); }
	
    ini_open(FILE_NAME_ITEMS);
    
	show_debug_message(global.equippedItems);
	
    for (var i = 0; i < array_length(global.equippedItems); i++) {
		
		var section = FILE_ITEM_SECTION + string(i);
		var item = global.equippedItems[i];
		var _id = item.id_item;
	
		ini_write_string(section, FILE_ITEM_ID_KEY, _id);
		
		for (var j = 0; j < array_length(item.enchants); j++) {
			var _enchId = item.enchants[j].ench_id;		
			ini_write_string(section, FILE_ITEM_ENCH_KEY + string(j) + ":", _enchId);
		}
    }
    ini_close();
}
function loadItemsSimple() {
    var fileName = "items.ini";
    if (!file_exists(fileName)) return;
    
    global.equippedItems = [];
    
    ini_open(fileName);
    
	var i = 0;
	while (true) {
	    var section = "Id for item: " + string(i);
	    if (!ini_key_exists(section, "Id")) { break; }
		
	    var idStr = ini_read_string(section, "Id", "0"); //the id of the current item
		global.equippedItems[i] = variable_clone(global.itemsInGame[idStr]); //duplicate it to have unique references
		
		//Saving the enchants the player put into the items
		for (var j = 0; j < 3; j++) {
			if (!ini_key_exists(section, "Enchant " + string(j) + " spr")) { break; }
			global.equippedItems[i].enchanted = true;
			//gets the reference of the sprite asset
			global.equippedItems[i].enchants[j][ENCHANT_SPRITE] = asset_get_index(ini_read_string(section, "Enchant " + string(j) + " spr", "0")); 
			 //gets the reference of the function asset
			global.equippedItems[i].enchants[j][ENCHANT_FUNCTION] = asset_get_index(ini_read_string(section, "Enchant " + string(j) + " func", "0"));
		}
	    i += 1;
	}
	
    ini_close();
}
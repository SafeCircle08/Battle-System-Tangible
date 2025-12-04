function saveItems() {
    var fileName = "items.ini";
    ini_open(fileName);
    
    for (var i = 0; i < array_length(global.equippedItems); i++) {
		var section = "Id for item: " + string(i);
		var item = global.equippedItems[i];
		var _id = item.id_number;
	
        ini_write_real(section, "Id", _id);
		
		for (var j = 0; j < array_length(item.enchants); j++) {
			var rawSpr  = string(item.enchants[j][ENCHANT_SPRITE]); //reference of the sprite asset
			var rawFunc = string(item.enchants[j][ENCHANT_FUNCTION]); //reference of the function asset
			
			var sprParts = string_split(rawSpr, " "); 
			var cleanSpr = sprParts[ array_length(sprParts) - 1 ]; //the cleaned reference
			
			var funcParts = string_split(rawFunc, " ");
			var cleanFunc = funcParts[ array_length(funcParts) - 1 ]; //the cleaned reference
			
			ini_write_string(section, "Enchant " + string(j) + " spr", cleanSpr);
			ini_write_string(section, "Enchant " + string(j) + " func", cleanFunc);	
		}
    }
    
    ini_close();
}
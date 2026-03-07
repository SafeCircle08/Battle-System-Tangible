function stringArrayToPagesArray(_stringList) {
	var _pagesArray = [];
	for (var i = 0; i < array_length(_stringList); i++) {
		array_push(_pagesArray, addAsPage(_stringList[i]));
	}
	return _pagesArray;
}
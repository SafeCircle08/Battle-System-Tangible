if (canCreateText() == false) {
	if (instance_exists(myTextInstance)) { instance_destroy(myTextInstance); }
	myTextInstance = undefined;
}

if (canCreateText() && myTextInstance == undefined) { createText(); }
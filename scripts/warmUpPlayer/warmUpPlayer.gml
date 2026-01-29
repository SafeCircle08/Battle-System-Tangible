function warmUpPlayer(_write = true) {
	healPlayer(25, sndPlayerBasicHeal);
	removeSegnalino(oIceSlideSegnalino, _write);
	oSoul.removeSlide();
	//other things related to warm and cold here
}
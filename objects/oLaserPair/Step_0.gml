if (timer > 0)  { 
	if (timer == timerRef - 50) { createChargingFX(); }
	timer--; 
} else if (self.timer == 0) {
	shootLaser();
	stopTimer();
}
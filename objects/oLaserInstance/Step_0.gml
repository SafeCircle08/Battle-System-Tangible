/*laserRayStepFunction();
*/

laseringTimer = setTimer(laseringTimer);
if (laseringTimer > 0) {
	frame += 0.5;
	image_xscale += sin(frame) / 10;
}
else {
	image_xscale -= 0.1;
	if (image_xscale <= 0) {
		if (creator.isInAGroup == true) {
			checkAllLaserPairInstances();
		} else { creator.startOver(); }
		instance_destroy(self); 
	}
}
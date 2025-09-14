event_inherited();

image_angle = 0;

negativeAttachedPole = undefined; //the negative instance
destinationX = undefined;
destinationY = undefined;

createElectricLink = function(negativeInstance) {
	negativeAttachedPole = negativeInstance;
	destinationX = negativeInstance.x;
	destinationY = negativeInstance.y;
}
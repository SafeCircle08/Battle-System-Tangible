startXScale = 2;
startYScale = 2;

image_xscale = startXScale;
image_yscale = startYScale;


if (instance_exists(oSoul)) {	
	x = oSoul.x;
	y = oSoul.y;
}

increaseWTimerRes = 10;
increaseWTimer = increaseWTimerRes;
increasedWGoal = 4;
frame = 0;
angleAdderSign = 1;

increaseWidth = function() {
	changeDimension(startXScale, startYScale, 0, 300, -0.1, 5, true);
	frame += 0.09;
	image_angle += (5 - (frame * frame)) * angleAdderSign;
}
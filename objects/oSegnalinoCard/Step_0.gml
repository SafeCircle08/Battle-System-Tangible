if (moving) {
	increaseAlpha(self, 0.05, 1);
	x = lerp(x, goalX, 0.2);
	y = lerp(y, goalY, 0.2);
}
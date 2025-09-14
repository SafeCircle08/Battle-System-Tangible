sparkTimer = setTimer(sparkTimer);

if (sparkTimer == 0) {
	var _spark;
	if (!isVertical()) {
		if (!isPositiveLeft()) {
			_spark = instance_create_layer(oSoul.x - 10 - (10 * sparkN), oSoul.y, LAYER_EXTRAS_OBJECTS, oElectricSpark);
		} else {
			_spark = instance_create_layer(oSoul.x + 10 + (10 * sparkN), oSoul.y, LAYER_EXTRAS_OBJECTS, oElectricSpark);
		}
	} else {
		if (!isPositiveAbove()) {
			_spark = instance_create_layer(oSoul.x, oSoul.y - 10 - (10 * sparkN), LAYER_EXTRAS_OBJECTS, oElectricSpark);	
		} else {
			_spark = instance_create_layer(oSoul.x, oSoul.y + 10 + (10 * sparkN), LAYER_EXTRAS_OBJECTS, oElectricSpark);		
		}
	}
	_spark.sprite_index = choose(sElectricSpark_1, sElectricSpark_2);
	
	sparkN++;
	electricTravelledDist += 10;
	
	if (!isVertical()) {
		if (electricTravelledDist >= distX - 10) {
			instance_destroy();
			movePlayerToPos(positivePoleRef.destinationX, positivePoleRef.destinationY);
			playerChangeState(global.playerCircuit);
		}
	}
	else {
		if (electricTravelledDist >= distY) {
			instance_destroy();
			movePlayerToPos(positivePoleRef.destinationX, positivePoleRef.destinationY);
			playerChangeState(global.playerCircuit);
		}
	}
	sparkTimer = sparkTimerRef;
}	
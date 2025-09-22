if (callingLasers.timer > 0) {
	if (image_index == indexWhenCreate) {
		var _fx = instance_create_layer(x, y, layer, oLaserChargeFX,
			{ image_angle: image_angle, image_yscale: image_yscale });
		_fx.callingLasers = callingLasers;
	}
}
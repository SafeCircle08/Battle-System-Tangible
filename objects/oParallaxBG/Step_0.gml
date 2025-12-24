switch (parallaxCoord) {
	case (PARALLAX_COORD.X): layer_x(layerToParallax, oCamera.finalCamX / parallaxValue); break;
	case (PARALLAX_COORD.Y): layer_y(layerToParallax, oCamera.finalCamY / parallaxValue); break;
}
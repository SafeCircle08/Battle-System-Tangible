function changeAlphaValue(startAlpha, finalAlpha, _alphaAmount, _destroyWhen0 = true) 
{
	//Checking if the alpha has reached the wanted value
	if (image_alpha == finalAlpha) { 
		if (_destroyWhen0) { instance_destroy(); }
		return;
	}
	
	//Increasing - Decreasing the alpha values
	if (image_alpha != finalAlpha) { image_alpha += _alphaAmount; }
	
	//Clamping values alphas
	if (startAlpha < finalAlpha) { 	image_alpha = clamp(image_alpha, startAlpha, finalAlpha); }
	else { 	image_alpha = clamp(image_alpha, finalAlpha, startAlpha); } 
}
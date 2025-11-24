function changeDimension(startXScale, startYScale, finalXScale, finalYScale, _scaleXamount, _scaleYamount = _scaleXamount, _destroyWhen0 = false)
{
	//Checking if the scale has reached the wanted goal
	if (image_xscale == finalXScale) && (image_yscale == finalYScale) { 
		if (_destroyWhen0) { instance_destroy(); print("distrutto ora!"); } 	
		return true; 
	}
	
	//Increasing - Decreasing scales
	if (image_xscale != finalXScale) { image_xscale += _scaleXamount; }
	if (image_yscale != finalYScale) { image_yscale += _scaleYamount; }
	
	//Clamping values X scale
	if (startXScale < finalXScale) { image_xscale = clamp(image_xscale, startXScale, finalXScale);  }
	else { 	image_xscale = clamp(image_xscale, finalXScale, startXScale);  }
	//Clamping values Y scale
	if (startYScale < finalYScale) { image_yscale = clamp(image_yscale, startYScale, finalYScale);  }
	else { 	image_yscale = clamp(image_yscale, finalYScale, startYScale);  }
	return false;
}
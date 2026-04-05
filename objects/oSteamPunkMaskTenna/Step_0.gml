attachToMaskPos();

hitFlash = max(0, hitFlash - 0.05);

if (shaking) shake();

if (moving) move();
if (deactivating) deactivate();
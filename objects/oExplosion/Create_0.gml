color = [c_red, c_purple, c_orange, c_blue, c_lime];
maxIndex = array_length(color);
index = irandom_range(0, maxIndex - 1);
frame = 0;

oCamera.shake(7);

image_xscale = 1.5;
image_yscale = 1.5;
frame++;
image_xscale = sin(frame / 10);
y--;
if (y < ystart - 50) {
	image_alpha -= 0.05;	
}

if (image_alpha <= 0) {
	sprite_delete(sprite_index);
	instance_destroy(self);
}
attachToCameraXPosition(sprite_get_width(sprite_index) / 2 - 1);

image_alpha -= 0.06;

if (image_alpha <= 0) { instance_destroy(self); }
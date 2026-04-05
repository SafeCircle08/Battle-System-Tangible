if (takenDir == false) {
	takenDir = true;
	dir = image_angle;
} 

var spd = 10;
image_angle += 3;
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

outSideWindow(self, sprite_index);
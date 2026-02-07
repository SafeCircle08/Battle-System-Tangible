draw_set_font(fMonoNotMono);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(image_alpha);
draw_set_color(drawColor);
draw_text(x + 1, y, textReference);
draw_text(x - 1, y, textReference);
draw_text(x, y + 2, textReference);
draw_text(x, y - 2, textReference);

var _xOffset = 2;
var _yOffset = 8;
var _sprX = x + (string_width(textReference) / 2) + _xOffset;
var _sprY = y - _yOffset;

draw_sprite(sFloatTxtTypes, typeIndex, _sprX, _sprY);
draw_set_color(c_black);

draw_text(x, y - 1, textReference);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fHungrySkinny);
draw_set_alpha(1.0);
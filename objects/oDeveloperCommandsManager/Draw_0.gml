var _introString = "C:>User>Undefined>";
draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, 50, false);
draw_set_font(fHungrySkinny);
draw_text_transformed(0.5, 0.5, _introString + input_text, 0.5, 0.5, 0);
draw_set_color(c_white);
draw_text_transformed(0, 0, _introString + input_text, 0.5, 0.5, 0);
draw_sprite(sTextCursorBar, 0, string_width(_introString) / 2 + string_width(input_text) / 2, 10);
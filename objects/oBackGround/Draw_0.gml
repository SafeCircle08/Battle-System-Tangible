shader_set(Shader7);

var t = current_time / 1000;
var s = sin(t);

var mx = mouse_x / room_width;
var my = mouse_y / room_height;

shader_set_uniform_f(time_uniform, t);
shader_set_uniform_f(color_uniform, 1.0, 0.7, 0.5, 1.0);
shader_set_uniform_f(mouse_uniform, mx, my);

shader_set_uniform_f(colorA_uniform, 255.0, 77.0, 240.0);
shader_set_uniform_f(colorB_uniform, 254.0, 136.0, 0.0);

draw_self();
shader_reset();	
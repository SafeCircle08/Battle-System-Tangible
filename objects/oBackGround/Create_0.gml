canScroll = false;
frame = -1;
image_alpha = 0.7;
x = 0;
y = 28;

time_uniform = shader_get_uniform(Shader7, "u_time");
mouse_uniform = shader_get_uniform(Shader7, "u_mouse");
color_uniform = shader_get_uniform(Shader7, "u_Color");

colorA_uniform = shader_get_uniform(Shader7, "colorA");
colorB_uniform = shader_get_uniform(Shader7, "colorB");
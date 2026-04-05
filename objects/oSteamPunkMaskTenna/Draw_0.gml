if (hitFlash > 0) {
	shader_set(shdDamageFeedback);
	var u = shader_get_uniform(shdDamageFeedback, "u_intensity");
	shader_set_uniform_f(u, hitFlash);
}

draw_self();

if (hitFlash > 0) shader_reset();
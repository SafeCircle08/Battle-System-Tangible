varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_intensity;

void main() {
	vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    vec4 redColor = vec4(1.0, 0.2, 0.2, baseColor.a);
    gl_FragColor = mix(baseColor, redColor, u_intensity);
}
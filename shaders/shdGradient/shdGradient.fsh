// shd_text_gradient - Fragment Shader
varying vec2 v_vTexcoord; // Coordinate UV del pixel
varying vec4 v_vColour;   // Colore base del testo
uniform vec4 u_colorTop;  // Colore superiore del gradiente
uniform vec4 u_colorBottom; // Colore inferiore del gradiente

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 gradientColor = mix(u_colorBottom, u_colorTop, v_vTexcoord.y);
    gl_FragColor = texColor * gradientColor * v_vColour;
}
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec2 u_mouse;
uniform vec4 u_Color;

const float PI = 3.141592;

uniform vec3 colorA;
uniform vec3 colorB;

float makeRgbCol(float colVal) {
	return (colVal / 255.0);
}

vec2 kaleidoscope(vec2 uv, float segments) {
    vec2 center = vec2(0.5, 0.5);
    
    uv -= center;

    float r = length(uv);
    float angle = atan(uv.y, uv.x);

    float slice = (2.0 * PI) / segments;

    angle = mod(angle, slice);
    angle = abs(angle - slice * 0.5);

    uv = vec2(cos(angle), sin(angle)) * r;

    uv += center;

    return uv;
}

void main() {
    vec2 uv = v_vTexcoord;
    float frequency = 20.0;
    float amplitude = 0.06;
    float speed = 1.0;
	
    uv.x += sin(uv.y * frequency + u_time * speed) * amplitude;
    uv.y += cos(uv.x * frequency + u_time * speed) * amplitude * 2.0;

	float colAR = makeRgbCol(colorA.r);
	float colAG =  abs(cos(u_time / 50.0)) * makeRgbCol(colorA.g);
	float colAB = sin(u_time / 5.0) * makeRgbCol(colorA.b);
    vec3 colorStart = vec3(colAR, colAG, colAB);
	
	float colBR = makeRgbCol(colorB.r);
	float colBG = makeRgbCol(colorB.g);
	float colBB = makeRgbCol(colorB.b);
    vec3 colorEnd = vec3(colBR, colBG, colBB);
	
    float t = uv.x - 0.3;
    vec3 gradColor = mix(colorStart, colorEnd, t);
	
    vec4 texColor = texture2D(gm_BaseTexture, uv);
    vec3 finalColor = mix(texColor.rgb, gradColor, 0.7);

    vec2 center = vec2(0.5, 0.5);
    float radius = 0.5;
    float mask = smoothstep(radius, radius - 0.1, distance(v_vTexcoord, center));
	
    gl_FragColor = vec4(finalColor, texColor.a) * mask * 2.0;
}
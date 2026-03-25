//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_time;
uniform float u_radius;
uniform float u_freqSpd;
uniform float u_starPower;
uniform float u_alpha;

uniform vec4 u_color1;
uniform vec4 u_color2;

void main() {
	
	vec2 uv = v_vTexcoord;
	vec2 st = (2. * uv - 1.);
	vec4 out_color = vec4(1.0, 1.0, 1.0, 1.0);
	
	float bubbleRadius = u_radius;
	vec2 p = (uv * 2.0 - 1.0) / bubbleRadius;
	float bdAmp = 0.02;
	float freq = u_freqSpd;
	p += sin(p.x * 7.0 + u_time * freq) * bdAmp;
	p += cos(p.y * 8.0 + u_time * freq) * bdAmp;
	float l = length(p);
	float edge = smoothstep(1.0, 0.9, l);
    float outline = smoothstep(1.0, 0.98, l) - smoothstep(0.98, 0.96, l);
    float r2 = dot(p, p);
    if (r2 > 1.05) discard;
	
    float z = sqrt(1.0 - r2);
    vec3 normal = normalize(vec3(p, z*z));

    float fresnel = pow(0.1 - normal.z, 2.0);
    fresnel = smoothstep(0.2, 1.0, fresnel);
    vec3 innerColor = vec3(0.922, 0.608, 0.196) * 1.1;
    vec3 edgeColor  = vec3(1.000, 0.000, 0.467) * 0.8;
    vec3 color = mix(normal, edgeColor, dot(p, p) * 0.8); 

    vec3 lightDir = normalize(vec3(0.310, 0.094, 0.906));
    vec3 viewDir = vec3(0.820, 0.251, 0.471);
    vec3 reflectDir = reflect(-lightDir, normal);

    float spec = pow(max(dot(reflectDir, viewDir), 0.0), 32.0);
	
    color += spec * 10.0;
    vec3 outlineColor = vec3(0.949, 0.376, 1.000);
    color = mix(color, outlineColor, outline);

    float star = 0.0;
    for (int i = 0; i < 70; i++) {
        float fi = float(i);
        vec2 b = vec2(
            sin(fi * 12.3 + u_time * 0.5) * p.x,
            cos(fi * 8.7  + u_time * 0.5) * p.y
        );
        star += smoothstep(0.08, 0.0, length(p - b)) * u_starPower;
    }
	
    color += vec3(0.7, 0.9, 1.0) * star / (dot(p, p)) / 120.0;
    out_color = vec4(color * 1.8, u_alpha);
	
    gl_FragColor = out_color;
}

shader_type canvas_item;

uniform float BarrelPower;
uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest_mipmap;

vec2 barrel_distort(vec2 uv) {
	vec2 d = uv-0.5;
	float r = length(d)/5.0;
	float theta = atan(d.y, d.x);
	float rf = pow(r, BarrelPower) / pow(0.5, BarrelPower - 1.0);
	return vec2(0.5) + rf*normalize(d);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 iResolution = 1.0 / SCREEN_PIXEL_SIZE;
	vec2 q = FRAGCOORD.xy / iResolution.xy;
	
	q = barrel_distort(q);
	vec3 col = texture(screen_texture, q).rgb;
	COLOR = vec4(col, 1.0);
}



//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

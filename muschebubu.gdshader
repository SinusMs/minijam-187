shader_type canvas_item;
uniform float grrr = 0.0f;

uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec3 color = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	COLOR.rgb = mix(vec3(0.0), color.rgb, 1.0 - sqrt((UV.x-0.5f)*(UV.x-0.5f) + (UV.y-0.5f) * (UV.y-0.5f)) * grrr);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

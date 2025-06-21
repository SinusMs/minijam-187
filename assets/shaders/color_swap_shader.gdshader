shader_type canvas_item;

uniform bool applyShader = false;

#define COLOR_AMOUNT 14

const vec3 colors[COLOR_AMOUNT] = {
	vec3(19, 2, 8)   / vec3(255), vec3(2, 19, 13)  / vec3(255), 
	vec3(31, 5, 16)  / vec3(255), vec3(5, 31, 20)  / vec3(255), 
	vec3(49, 5, 30)  / vec3(255), vec3(5, 49, 24)  / vec3(255), 
	vec3(70, 14, 43)  / vec3(255), vec3(14, 70, 41)  / vec3(255), 
	vec3(124, 24, 60)  / vec3(255), vec3(24, 124,88)  / vec3(255), 
	vec3(255, 130, 116)  / vec3(255), vec3(60, 213, 167)  / vec3(255), 
	vec3(213, 60, 106)  / vec3(255), vec3(116, 241, 255)  / vec3(255)};

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(applyShader) {
		for(int i = 0; i < COLOR_AMOUNT; i++) {
			if (COLOR.a == 0.0) discard;
			if(length(abs(COLOR.rgb - colors[i])) < 0.1) {
				if(i % 2 == 0) {
					COLOR = vec4(colors[i + 1], 1.0);
					break;
				} else {
					COLOR = vec4(colors[i - 1], 1.0);
					break;
				}
			}
		}
	}
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}

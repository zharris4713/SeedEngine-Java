#version 400 core
layout (location = 0) out vec4 gColor;
layout (location = 1) out vec4 gPosition;
layout (location = 2) out vec3 gNormal;
layout (location = 3) out vec4 gRSMAo;
layout (location = 4) out vec3 gCamera;

out vec4 color;

in vec3 ToCamera;
in vec3 Normal;
in vec2 TexCoords;
in vec3 FragPos;

uniform sampler2D textureSampler0;

vec4 calculate_color() {
    return texture(textureSampler0, TexCoords);
}

vec4 calculate_gPosition() {
    return vec4(FragPos, gl_FragDepth);
}

vec4 calculate_gRSMAo() {
    return vec4(0,0,0,0);
}

vec4 calculate_gColor() {
    return texture(textureSampler0, TexCoords);
}

vec3 calculate_gNormal() {
    return Normal;
}

vec3 calculate_gCamera() {
    return (ToCamera + 1) / 2;
}

void main(void) {

    color = calculate_color();
    gPosition = calculate_gPosition();
    gRSMAo = calculate_gRSMAo();
    gColor = calculate_gColor();
    gNormal = calculate_gNormal();
    gCamera = calculate_gCamera();

}

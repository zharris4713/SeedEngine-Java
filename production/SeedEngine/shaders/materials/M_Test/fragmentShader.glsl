#version 400 core
layout (location = 0) out vec4 gColor;
layout (location = 1) out vec4 gPosition;
layout (location = 2) out vec3 gNormal;
layout (location = 3) out vec4 gRSMAo;
layout (location = 4) out vec3 gCamera;

out vec4 color;

in vec3 FragPos;
in vec3 Normal;
in vec3 ToCamera;
in vec2 TexCoords;

uniform sampler2D textureSampler0;

vec4 calculate_gColor() {
    return texture(textureSampler0, TexCoords);
}

vec4 calculate_gPosition() {
    return vec4(FragPos, gl_FragDepth);
}

vec3 calculate_gNormal() {
    return Normal;
}

vec4 calculate_color() {
    return texture(textureSampler0, TexCoords);
}

vec4 calculate_gRSMAo() {
    return vec4(0,0,0,0);
}

vec3 calculate_gCamera() {
    return (ToCamera + 1) / 2;
}

void main(void) {

    gColor = calculate_gColor();
    gPosition = calculate_gPosition();
    gNormal = calculate_gNormal();
    color = calculate_color();
    gRSMAo = calculate_gRSMAo();
    gCamera = calculate_gCamera();

}

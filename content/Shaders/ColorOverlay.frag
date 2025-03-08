#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    vec3 overlayColor;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main(){
    vec4 texColor = texture(source, qt_TexCoord0);
    vec3 blendedColor = mix(texColor.rgb, ubuf.overlayColor, texColor.a);
    fragColor = vec4(blendedColor, texColor.a);
} 
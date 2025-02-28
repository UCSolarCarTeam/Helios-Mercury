#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    vec3 overlayColor;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main() {
    // Sample the texture
    vec4 texColor = texture(source, qt_TexCoord0);
    
    // Lower threshold for color replacement (more aggressive)
    float alphaThreshold = 0.05;
    
    // More aggressive replacement factor - considers alpha threshold
    float replaceFactor = step(alphaThreshold, texColor.a);
    
    // Completely replace colors instead of blending when alpha is above threshold
    vec3 resultColor = ubuf.overlayColor * replaceFactor;
    
    // Maintain original alpha for proper transparency blending
    fragColor = vec4(resultColor, texColor.a);
}
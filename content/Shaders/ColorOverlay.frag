#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    vec3 overlayColor;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main() {
    vec4 texColor = texture(source, qt_TexCoord0);
    
    // Calculate luminance to preserve detail structure
    float luminance = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    // Use a smooth transition based on alpha
    // This preserves anti-aliasing at the edges
    vec3 originalWithLuminance = texColor.rgb * luminance;
    
    // Apply mix with progressive blending factor based on alpha
    // Higher alpha values get more overlay color
    float blendFactor = 0.9 * smoothstep(0.0, 0.2, texColor.a);
    vec3 resultColor = mix(originalWithLuminance, ubuf.overlayColor, blendFactor);
    
    // Output with original alpha
    fragColor = vec4(resultColor, texColor.a);
}
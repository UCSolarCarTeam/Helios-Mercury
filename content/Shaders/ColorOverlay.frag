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
    
    // Key smoothing parameters (adjust these)
    float edgeSoftness = 0.05;   // Lower = softer edge (range 0.01 - 0.2)
    float blendIntensity = 0.7;  // Lower = less aggressive overlay (range 0.5 - 0.9)
    
    // Calculate luminance to preserve detail structure
    float luminance = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    // Soft edge alpha calculation
    // Adjust these parameters for different edge behaviors
    float softAlpha = smoothstep(edgeSoftness, 1.0 - edgeSoftness, texColor.a);
    
    // Blend factor with soft transition
    float blendFactor = blendIntensity * softAlpha;
    
    // Use luminance-preserved original color
    vec3 originalWithLuminance = texColor.rgb * luminance;
    
    // Apply mix with the new soft alpha blending
    vec3 resultColor = mix(originalWithLuminance, ubuf.overlayColor, blendFactor);
    
    // Output with softened alpha
    fragColor = vec4(resultColor, softAlpha * texColor.a);
}
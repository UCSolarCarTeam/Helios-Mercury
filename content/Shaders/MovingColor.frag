#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    float u_time;
    vec3 baseColor;
    vec3 movingColor;
} ubuf;

layout(binding = 1) uniform sampler2D source;

/** 
 *  This shader applies a moving color effect to a object. It samples the texture 
 *  and blends it with a base color based on a time-varying horizontal bar. The bar's 
 *  position and speed change over time.
 */
void main() {
    // Sample the texture
    vec4 texColor = texture(source, qt_TexCoord0);
    vec2 uv = qt_TexCoord0;

    // Time-varying horizontal position of the bar (wraps around)
    float time = fract(ubuf.u_time); // Wrap time to range [0, 1)
    float speed = mix(0.2, 0.3, time); // Interpolate speed from 0.2 to 0.3 for slow acceleration effect
    float barPosition = fract(time * speed * 3.5); // Calculate bar position with varying speed

    float barWidth = 0.1;

    // Calculate bar opacity with sharper transition
    float barMask = smoothstep(barPosition - barWidth * 0.3, barPosition + barWidth * 0.3, uv.x);
    
    // Lower threshold for color replacement (more aggressive)
    float alphaThreshold = 0.05;
    
    // Calculate luminance of the original texture (to detect light areas)
    float luminance = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    // More aggressive replacement factor - considers both alpha and brightness
    float replaceFactor = step(alphaThreshold, texColor.a);
    
    // Completely replace colors instead of blending when alpha is above threshold
    vec3 resultColor;
    if (uv.x < barPosition) {
        // Left side of bar uses moving color
        resultColor = ubuf.movingColor * replaceFactor;
    } else {
        // Right side uses base color
        resultColor = ubuf.baseColor * replaceFactor;
    }
    
    // Only keep original color where alpha is below threshold
    resultColor = mix(vec3(0.0), resultColor, replaceFactor);
    
    // Output the final color, preserving original alpha
    fragColor = vec4(resultColor, texColor.a);
}
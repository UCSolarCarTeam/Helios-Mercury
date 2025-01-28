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

    // Calculate bar opacity
    float barMask = smoothstep(barPosition - barWidth * 0.5, barPosition + barWidth * 0.5, uv.x);

    // Blend base color with the texture color based on the bar mask, only filling non-transparent parts
    vec3 blendedColor = mix(texColor.rgb, ubuf.baseColor, barMask * texColor.a);

    // Blend the underlying color on the left side of the bar, only affecting non-transparent parts
    if (uv.x < barPosition && texColor.a > 0.0) {
        blendedColor = mix(ubuf.movingColor, blendedColor, barMask);
    }

    // Output the final color with the original texture alpha
    fragColor = vec4(blendedColor, texColor.a);
}

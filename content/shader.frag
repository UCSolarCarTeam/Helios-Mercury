#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    float u_time;
    vec3 baseColor;
    vec3 underlyingColor;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main() {
    // Sample the texture
    vec4 texColor = texture(source, qt_TexCoord0);

    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = qt_TexCoord0;

    // Base green color
    //vec3 baseColor = vec3(0.0, 1.0, 0.0); // Green color

    // Underlying color after the wipe
    //vec3 underlyingColor = vec3(1.0, 0.0, 0.0); // Red color

    // Time-varying horizontal position of the bar (wraps around)
    float time = fract(ubuf.u_time); // Wrap time to range [0, 1)
    float speed = mix(0.2, 0.3, time); // Interpolate speed from 0.2 to 0.5
    float barPosition = fract(time * speed * 3.5); // Calculate bar position with varying speed

    // Width of the bar
    float barWidth = 0.1;

    // Calculate bar opacity (0.1 inside the bar, 1.0 outside)
    float barMask = smoothstep(barPosition - barWidth * 0.5, barPosition + barWidth * 0.5, uv.x);

    // Blend the green color with the texture color based on the bar mask, only affecting non-transparent parts
    vec3 blendedColor = mix(texColor.rgb, ubuf.baseColor, barMask * texColor.a);

    // Blend the underlying color on the left side of the bar, only affecting non-transparent parts
    if (uv.x < barPosition && texColor.a > 0.0) {
        blendedColor = mix(ubuf.underlyingColor, blendedColor, barMask);
    }

    // Output the final color with the original texture alpha
    fragColor = vec4(blendedColor, texColor.a);
}
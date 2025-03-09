#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    float u_time;
    vec3 baseColor;
    vec3 movingColor;
} ubuf;

// sampler for the source texture
layout(binding = 1) uniform sampler2D source;

/** 
 *  This shader applies a moving color effect to a object. It samples the texture 
 *  and blends it with a base color based on a time-varying horizontal bar. The bar's 
 *  position and speed change over time.
 */
void main() {
    // Sample the texture at the current coorindates 
    vec4 texColor = texture(source, qt_TexCoord0);
    vec2 uv = qt_TexCoord0;

    // Calculating the horizontal position of the moving bar 
    float time = fract(ubuf.u_time); // Wrap time to range [0, 1)
    float speed = mix(0.2, 0.3, time); // Interpolate speed from 0.2 to 0.3 for slow acceleration effect
    float barPosition = fract(time * speed * 3.5); // Calculate bar position with varying speed

    float barWidth = 0.1;

    // Creating smooth transition of the shader at the edges 
    float barMask = smoothstep(barPosition - barWidth * 0.3, barPosition + barWidth * 0.3, uv.x);
    
    //alpha threshold for the replacement colors 
    float alphaThreshold = 0.05;
    
    // detecting luminance for the brighter pixes of the png 
    float luminance = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    float replaceFactor = step(alphaThreshold, texColor.a);
    
    // Determining the output color based on the position of the bar
    vec3 resultColor;
    if (uv.x < barPosition) {
        // Left side of bar uses moving color
        resultColor = ubuf.movingColor * replaceFactor;
    } else {
        // Right side uses base color
        resultColor = ubuf.baseColor * replaceFactor;
    }
    
    // applying color of the main shader with alpha value
    resultColor = mix(vec3(0.0), resultColor, replaceFactor);
    
    // Output the final color fo shader
    fragColor = vec4(resultColor, texColor.a);
}
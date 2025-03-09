#version 440

layout(location=0) in vec2 qt_TexCoord0;

layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    vec3 overlayColor;
} ubuf;

// Creating a sampler of the image
layout(binding = 1) uniform sampler2D source;

void main() {

    // Sampling the color at current coorinates 
    vec4 texColor = texture(source, qt_TexCoord0);
    
    // Controls the Softness at the edges of the image
    float edgeSoftness = 0.05;   
    
    // controls the strength of the overlay
    float blendIntensity = 0.7;  
    
    // Calculating the luminace to keep the oringal structure of the png
    float luminance = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    // creating smooth transition at the edge of the png
    float softAlpha = smoothstep(edgeSoftness, 1.0 - edgeSoftness, texColor.a);
    
    // calculating the blend factor for the transition at the border of the image
    float blendFactor = blendIntensity * softAlpha;
    
    // creating a blend in between lumincae and original overlay color 
    vec3 originalWithLuminance = texColor.rgb * luminance;
    
    // result of teh blend 
    vec3 resultColor = mix(originalWithLuminance, ubuf.overlayColor, blendFactor);
    
    // output
    fragColor = vec4(resultColor, softAlpha * texColor.a);
}
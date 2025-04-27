#version 330 core

layout (location = 0) in vec3 vertex; 
layout (location = 1) in vec3 normal; 
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;

out vec3 normeye;
out vec3 verteye;


void main() 
{
    vec3 P = (modelViewMatrix * vec4(vertex, 1.0)).xyz;
    vec3 N = normalize(normalMatrix * normal);
    vec3 V = normalize(-P);
    
    normeye = N;
    verteye = P;
    
    frontColor= vec4(color,1.0) * N.z;
    gl_Position= modelViewProjectionMatrix * vec4(vertex, 1.);
}

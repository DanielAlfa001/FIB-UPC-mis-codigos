#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 normal; 

in vec3 normeye;
in vec3 verteye;

uniform vec4 matAmbient, matDiffuse, matSpecular; //material --> Ka Kd Ks
uniform vec4 lightAmbient, lightDiffuse, lightSpecular; //luz --> La Ld Ls
uniform vec4 lightPosition;
uniform mat3 normalMatrix;
uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform float matShininess;

vec4 light(vec3 N, vec3 V, vec3 L)
{
    vec3 R = normalize(2.0 * dot(N,L) * N - L);
    float NdotL= max( 0.0, dot(N, L) );
    float RdotV= max( 0.0, dot(R, V) );
    float Idiff= NdotL;
    float Ispec= 0;
    if (NdotL>0) Ispec = pow(RdotV, matShininess);
    return matAmbient * lightAmbient + matDiffuse * lightDiffuse * Idiff + matSpecular * lightSpecular * Ispec;
}

void main()
{
    vec3 N = normeye;
    vec3 V = normalize(-verteye);
    vec3 L = normalize(lightPosition.xyz - verteye);
    fragColor =  light(N,V,L);
}

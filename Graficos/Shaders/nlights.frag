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
uniform int n = 4;
const float pi = 3.141592;

vec4 light(vec3 N, vec3 V, vec3 L)
{
    vec3 R = normalize(2.0 * dot(N,L) * N - L);
    float NdotL= max( 0.0, dot(N, L) );
    float RdotV= max( 0.0, dot(R, V) );
    float Idiff= NdotL;
    float Ispec= 0;
    if (NdotL>0) Ispec = pow(RdotV, matShininess);
    return (matDiffuse * lightDiffuse * Idiff) / sqrt(n) + matSpecular * lightSpecular * Ispec;
}

void main()
{
    vec3 N = normeye;
    vec3 V = normalize(-verteye);
    fragColor =  vec4(0.0,0.0,0.0,0.0);
    
    for (int i = 0; i < n; i++) {
        float angle = pi/180.0 * i * 360.0/float(n);
        vec3 ilight = vec3(lightPosition.x + 10.0  * cos(angle),lightPosition.y  + 10.0 * sin(angle),lightPosition.z);
        vec3 L = normalize(ilight - verteye);
        //vec3 ilight = vec3(L.x + 10.0  * cos(angle),L.y  + 10.0 * sin(angle),L.z);
        fragColor = fragColor + light(N,V,L);
     }
}

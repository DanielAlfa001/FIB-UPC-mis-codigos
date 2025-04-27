#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

const vec3 blue = vec3(0,0,1);
const vec3 cyan = vec3(0,1,1);
const vec3 green = vec3(0,1,0);
const vec3 yellow = vec3(1,1,0);
const vec3 red = vec3(1,0,0);
const vec3 ycolor[5] = vec3 [5](red,yellow,green,cyan,blue);


void main()
{
    float cplace = 4 * (vertex.y - boundingBoxMin.y)/(boundingBoxMax.y - boundingBoxMin.y); //conversion factor
    
    int ncolor = int(floor(cplace));
    

    vec3 gradient;
    
    if (cplace > 4) gradient = ycolor[4];
    if (cplace < 0) gradient = ycolor[0];
    gradient = mix(ycolor[ncolor + 0],ycolor[ncolor + 1], fract(cplace));
    
    
    frontColor = vec4(gradient,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}

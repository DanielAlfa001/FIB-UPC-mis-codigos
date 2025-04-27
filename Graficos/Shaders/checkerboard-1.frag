#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

vec4 negro = vec4(0.0);
vec4 gris = vec4(0.8);

uniform sampler2D colorMap;

int s = int(fract(vtexCoord.s) * 8);
int t = int(fract(vtexCoord.t) * 8);

void main() 
{
    if ((s + t) % 2 == 0) fragColor = gris;
    else fragColor = negro;
}

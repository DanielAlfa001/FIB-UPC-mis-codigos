#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

void main()
{
    float perlin = texture(noise0,vtexCoord).r;
    vec4 rocktex = texture(rock1,vtexCoord);
    vec4 grasstex = texture(grass2,vtexCoord);
    fragColor = mix(rocktex,grasstex,perlin);
}

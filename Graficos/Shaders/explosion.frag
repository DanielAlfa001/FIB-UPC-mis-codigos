#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

vec2 sizeboard = vec2(8.0,6.0);
vec2 iteration = vec2(1.0 / sizeboard.s, 1.0 / sizeboard.t);

uniform sampler2D explosion;
uniform float time;

void main()
{
    int frame = int(floor(time * 30.0));
    int tframe = frame / 8;
    vec2 coordenadas;
    
    float row = int(0.0);
    float col = int(0.0);
    coordenadas.s = vtexCoord.s /sizeboard.s + iteration.s * (0.0 + frame);
    coordenadas.t = vtexCoord.t / sizeboard.t + iteration.t * (5.0 - tframe);
    fragColor = texture(explosion,coordenadas);
    fragColor = fragColor.a * fragColor;
}

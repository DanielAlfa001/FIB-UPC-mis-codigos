#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

const vec2 pointC = vec2(0.5,0.5);
void main()
{
    float d = length(vec2(vtexCoord.x - pointC.x, vtexCoord.y - pointC.y));
    
    float n = step(0.2,d); // 1 si d >= 0'2, 0 si d < 0'2
    fragColor = vec4(1,n,n,1);
}

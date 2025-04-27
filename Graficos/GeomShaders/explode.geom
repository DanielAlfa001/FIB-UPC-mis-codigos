#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 vernorm[];
in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
const float speed = 0.5;


void main( void )
{
    
    vec3 avg = (vernorm[0] + vernorm[1] + vernorm[2])/3.0;
    
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		float factor = speed * time;
		
		mat4 mtf = mat4(vec4(1,0,0,0),vec4(0,1,0,0),vec4(0,0,1,0),vec4(factor * avg.x,factor * avg.y,factor * avg.z,1));
		vec4 vtf = mtf * gl_in[i].gl_Position;
		gl_Position = modelViewProjectionMatrix * vtf;
		EmitVertex();
		gfrontColor = vfrontColor[i];
	}
	
    EndPrimitive();
}

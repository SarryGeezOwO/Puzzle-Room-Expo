//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 texel;

const float xSpd = 0.001;
const float xFreq = 100.0;
const float xSize = 5.0;

const float yFreq = 50.0;
const float ySize = 8.0;

void main()
{
	
	float xWave = sin(time * xSpd + v_vTexcoord.y * xFreq) * (xSize * texel.x) * v_vTexcoord.y;
	float yWave = sin(time * xSpd + v_vTexcoord.y * yFreq) * (ySize * texel.y) * v_vTexcoord.y;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(xWave, yWave));
}

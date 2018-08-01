struct VertexInputType
{
	// per vertex
    float3 position : POSITION;			
	
	// per instance
	float3 cubeCenter : CENTER;			//center in world space
	matrix wvp : WVP;					//this wvp can be model world * cubeWVP
};

struct PixelInputType
{
    float4 position : SV_POSITION;
	float3 dir:  DIR;
};

PixelInputType VS(VertexInputType input)
{
    PixelInputType output;
    
	//cube is always axes aligned, and in world space, so, transform position to cube space.
    output.position = mul(float4(input.position, 1), input.wvp);

	output.dir = input.position.xyz - input.cubeCenter;
		
	return output;
}
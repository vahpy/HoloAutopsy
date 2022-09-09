// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "VolumeRendering/SliceRenderingXrayColor"
{
	Properties
	{
		_DataTex("Data Texture (Generated)", 3D) = "" {}
		[Toggle(_Outline_On)] _DrawOutline("Draw Outline", Float) = 0.0
	}
		SubShader
	{
		Tags { "Queue" = "Transparent" }
		LOD 100
		Cull Off
		Blend SrcAlpha OneMinusSrcAlpha
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma shader_feature _Outline_On

			#include "UnityCG.cginc"



			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				float4 relVert : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			sampler3D _DataTex;
			

			// Parent's inverse transform (used to convert from world space to volume space)
			uniform float4x4 _parentInverseMat;
			// Plane transform
			uniform float4x4 _planeMat;

			uniform float colourr;

			v2f vert(appdata v)
			{
				v2f o;

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.vertex = UnityObjectToClipPos(v.vertex);
				// Calculate plane vertex world position.
				float3 vert = mul(_planeMat, float4(v.uv.x - 0.5f, v.uv.y - 0.5f,0.0f,  1.0f));
				// Convert from world space to volume space.
				o.relVert = mul(_parentInverseMat, float4(vert, 1.0f));
				o.uv = v.uv;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				float3 dataCoord = i.relVert + float3(0.5f, 0.5f, 0.5f);
				// If the current fragment is outside the volume, simply colour it black.
				// Note: Unity does not seem to have support for clamping texture coordinates to a border value, so we have to do this manually
#if defined(_Outline_On)  
				if (i.uv.x > 0.99f || i.uv.y > 0.99f || i.uv.x < 0.01f || i.uv.y < 0.01f) {
					return float4(1.0f, 0.7f, 0.0f, 1.0f);
				}
#endif
				if (dataCoord.x > 1.0f || dataCoord.y > 1.0f || dataCoord.z > 1.0f || dataCoord.x < 0.0f || dataCoord.y < 0.0f || dataCoord.z < 0.0f)
				{
				   return float4(0.1f, 0.1f, 0.1f, 1.0f);
				}
				else
				{
					// Sample the volume texture.
					float dataVal = tex3D(_DataTex, dataCoord);
					if (dataVal < 0.1) {
						dataVal = 0.1f;
					}
					return float4(dataVal, dataVal, dataVal, 1.0f);
				}
			}
			ENDCG
		}
	}
}

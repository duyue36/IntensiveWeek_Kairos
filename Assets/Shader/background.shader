// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-1091-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32251,y:32558,ptovrint:False,ptlb:WhiteColor,ptin:_WhiteColor,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9,c2:0.9,c3:0.9,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9980,x:32123,y:32676,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_9980,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0d9a313cf5e4208449f00aa81f4a6434,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5245,x:32261,y:32960,ptovrint:False,ptlb:BlackColor,ptin:_BlackColor,varname:node_5245,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:1091,x:32474,y:32797,varname:node_1091,prsc:2|A-7241-RGB,B-5245-RGB,T-9980-RGB;proporder:7241-9980-5245;pass:END;sub:END;*/

Shader "Shader Forge/background" {
    Properties {
        _WhiteColor ("WhiteColor", Color) = (0.9,0.9,0.9,1)
        _mask ("mask", 2D) = "white" {}
        _BlackColor ("BlackColor", Color) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _WhiteColor;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float4 _BlackColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float3 emissive = lerp(_WhiteColor.rgb,_BlackColor.rgb,_mask_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

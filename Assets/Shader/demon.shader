// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32887,y:32666,varname:node_3138,prsc:2|emission-722-RGB,olwid-2815-OUT;n:type:ShaderForge.SFN_Tex2d,id:722,x:32354,y:32608,ptovrint:False,ptlb:node_722,ptin:_node_722,varname:node_722,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1df2be314519175459e60b1369537768,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Time,id:9416,x:32109,y:33211,varname:node_9416,prsc:2;n:type:ShaderForge.SFN_Cos,id:9447,x:32339,y:33211,varname:node_9447,prsc:2|IN-9416-T;n:type:ShaderForge.SFN_Multiply,id:2157,x:32647,y:33046,varname:node_2157,prsc:2|A-2622-OUT,B-9447-OUT;n:type:ShaderForge.SFN_RemapRange,id:2815,x:32720,y:32812,varname:node_2815,prsc:2,frmn:-1,frmx:1,tomn:0.1,tomx:0.2|IN-2157-OUT;n:type:ShaderForge.SFN_RemapRange,id:2622,x:32521,y:33266,varname:node_2622,prsc:2,frmn:-1,frmx:1,tomn:1,tomx:2|IN-2505-OUT;n:type:ShaderForge.SFN_Cos,id:2505,x:32339,y:33390,varname:node_2505,prsc:2|IN-9416-TTR;proporder:722;pass:END;sub:END;*/

Shader "Shader Forge/demon" {
    Properties {
        _node_722 ("node_722", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 node_9416 = _Time + _TimeEditor;
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*(((cos(node_9416.a)*0.5+1.5)*cos(node_9416.g))*0.05+0.15),1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(float3(0,0,0),0);
            }
            ENDCG
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
            uniform sampler2D _node_722; uniform float4 _node_722_ST;
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
                float4 _node_722_var = tex2D(_node_722,TRANSFORM_TEX(i.uv0, _node_722));
                float3 emissive = _node_722_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

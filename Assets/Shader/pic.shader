// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-1644-OUT,olwid-9550-OUT;n:type:ShaderForge.SFN_Tex2d,id:8323,x:32243,y:32996,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_8323,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ac83035f32c4c884f9b2323e0321bef2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:1644,x:32536,y:32755,ptovrint:False,ptlb:MaskActivation,ptin:_MaskActivation,varname:node_1644,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1691-RGB,B-8758-OUT;n:type:ShaderForge.SFN_Color,id:1691,x:32255,y:32577,ptovrint:False,ptlb:Black Color,ptin:_BlackColor,varname:node_1691,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:0;n:type:ShaderForge.SFN_Color,id:2215,x:32130,y:32792,ptovrint:False,ptlb:White Color,ptin:_WhiteColor,varname:node_2215,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:8758,x:32404,y:32879,varname:node_8758,prsc:2|A-1691-RGB,B-2215-RGB,T-8323-R;n:type:ShaderForge.SFN_Slider,id:9550,x:32384,y:33114,ptovrint:False,ptlb:node_9550,ptin:_node_9550,varname:node_9550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01775236,max:1;proporder:8323-1644-1691-2215-9550;pass:END;sub:END;*/

Shader "Shader Forge/pic" {
    Properties {
        _Mask ("Mask", 2D) = "white" {}
        [MaterialToggle] _MaskActivation ("MaskActivation", Float ) = 0
        _BlackColor ("Black Color", Color) = (0,0,0,0)
        _WhiteColor ("White Color", Color) = (1,1,1,1)
        _node_9550 ("node_9550", Range(0, 1)) = 0.01775236
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
            uniform float _node_9550;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*_node_9550,1) );
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
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform fixed _MaskActivation;
            uniform float4 _BlackColor;
            uniform float4 _WhiteColor;
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
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(i.uv0, _Mask));
                float3 emissive = lerp( _BlackColor.rgb, lerp(_BlackColor.rgb,_WhiteColor.rgb,_Mask_var.r), _MaskActivation );
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

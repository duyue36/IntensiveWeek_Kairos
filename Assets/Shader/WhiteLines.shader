// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7241-RGB,olwid-4789-OUT,voffset-1456-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32452,y:32717,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Time,id:5007,x:31575,y:33152,varname:node_5007,prsc:2;n:type:ShaderForge.SFN_Cos,id:7598,x:32302,y:33268,varname:node_7598,prsc:2|IN-5007-TTR;n:type:ShaderForge.SFN_RemapRange,id:4789,x:32502,y:33083,varname:node_4789,prsc:2,frmn:-1,frmx:1,tomn:0.005,tomx:0.02|IN-7598-OUT;n:type:ShaderForge.SFN_Panner,id:6294,x:31992,y:32525,varname:node_6294,prsc:2,spu:0.5,spv:1|UVIN-1390-OUT,DIST-708-OUT;n:type:ShaderForge.SFN_TexCoord,id:2604,x:31531,y:32572,varname:node_2604,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector1,id:220,x:31454,y:32814,varname:node_220,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:1456,x:32452,y:32919,varname:node_1456,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.05|IN-7372-RGB;n:type:ShaderForge.SFN_Multiply,id:1390,x:31804,y:32525,varname:node_1390,prsc:2|A-2604-UVOUT,B-220-OUT;n:type:ShaderForge.SFN_Add,id:9872,x:31661,y:32155,varname:node_9872,prsc:2|A-2604-UVOUT,B-5072-OUT;n:type:ShaderForge.SFN_Vector2,id:5072,x:31580,y:32332,varname:node_5072,prsc:2,v1:0.1,v2:-0.3;n:type:ShaderForge.SFN_Tex2d,id:7372,x:32161,y:32645,ptovrint:False,ptlb:node_7372,ptin:_node_7372,varname:node_7372,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4fbadde725fe5a441a70a0d086cb2c7b,ntxv:0,isnm:False|UVIN-6294-UVOUT;n:type:ShaderForge.SFN_Divide,id:708,x:31929,y:32940,varname:node_708,prsc:2|A-5007-T,B-8526-OUT;n:type:ShaderForge.SFN_Slider,id:8526,x:31565,y:32902,ptovrint:False,ptlb:node_8526,ptin:_node_8526,varname:node_8526,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:12.305,max:20;proporder:7241-7372-8526;pass:END;sub:END;*/

Shader "Shader Forge/WhiteLines" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _node_7372 ("node_7372", 2D) = "white" {}
        _node_8526 ("node_8526", Range(0, 20)) = 12.305
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
            uniform sampler2D _node_7372; uniform float4 _node_7372_ST;
            uniform float _node_8526;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_5007 = _Time + _TimeEditor;
                float2 node_6294 = ((o.uv0*1.0)+(node_5007.g/_node_8526)*float2(0.5,1));
                float4 _node_7372_var = tex2Dlod(_node_7372,float4(TRANSFORM_TEX(node_6294, _node_7372),0.0,0));
                v.vertex.xyz += (_node_7372_var.rgb*0.05+0.0);
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*(cos(node_5007.a)*0.0075+0.0125),1) );
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
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _node_7372; uniform float4 _node_7372_ST;
            uniform float _node_8526;
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
                float4 node_5007 = _Time + _TimeEditor;
                float2 node_6294 = ((o.uv0*1.0)+(node_5007.g/_node_8526)*float2(0.5,1));
                float4 _node_7372_var = tex2Dlod(_node_7372,float4(TRANSFORM_TEX(node_6294, _node_7372),0.0,0));
                v.vertex.xyz += (_node_7372_var.rgb*0.05+0.0);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_7372; uniform float4 _node_7372_ST;
            uniform float _node_8526;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_5007 = _Time + _TimeEditor;
                float2 node_6294 = ((o.uv0*1.0)+(node_5007.g/_node_8526)*float2(0.5,1));
                float4 _node_7372_var = tex2Dlod(_node_7372,float4(TRANSFORM_TEX(node_6294, _node_7372),0.0,0));
                v.vertex.xyz += (_node_7372_var.rgb*0.05+0.0);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

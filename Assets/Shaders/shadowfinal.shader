// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33524,y:32597,varname:node_9361,prsc:2|emission-2460-OUT,custl-5115-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8068,x:32742,y:33281,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_LightColor,id:3406,x:32637,y:33117,varname:node_3406,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6869,x:31858,y:32654,varname:node_6869,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9684,x:31858,y:32782,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:7782,x:32095,y:32738,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-6869-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Multiply,id:2746,x:32465,y:32866,cmnt:Specular Contribution,varname:node_2746,prsc:2|A-7782-OUT,B-5267-OUT,C-4865-RGB;n:type:ShaderForge.SFN_Multiply,id:1941,x:32465,y:32693,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-5927-RGB,B-7782-OUT;n:type:ShaderForge.SFN_Color,id:5927,x:32415,y:31922,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Exp,id:1700,x:32070,y:33054,varname:node_1700,prsc:2,et:1|IN-9978-OUT;n:type:ShaderForge.SFN_Slider,id:5328,x:31529,y:33056,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Power,id:5267,x:32268,y:32912,varname:node_5267,prsc:2|VAL-7782-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_Add,id:2159,x:32657,y:32737,cmnt:Combine,varname:node_2159,prsc:2|A-1941-OUT,B-2746-OUT;n:type:ShaderForge.SFN_Multiply,id:5085,x:33180,y:32965,cmnt:Attenuate and Color,varname:node_5085,prsc:2|A-6089-OUT,B-3406-RGB,C-8068-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:9978,x:31858,y:33056,varname:node_9978,prsc:2,a:1,b:11|IN-5328-OUT;n:type:ShaderForge.SFN_Color,id:4865,x:32268,y:33095,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:node_4865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:33022,y:32333,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2460,x:33236,y:32275,cmnt:Ambient Light,varname:node_2460,prsc:2|A-5927-RGB,B-7528-RGB;n:type:ShaderForge.SFN_UVTile,id:2439,x:31954,y:32348,varname:node_2439,prsc:2|UVIN-9049-UVOUT,WDT-9982-OUT,HGT-9982-OUT,TILE-6134-OUT;n:type:ShaderForge.SFN_Vector1,id:6134,x:31525,y:32396,varname:node_6134,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:9049,x:31525,y:32207,varname:node_9049,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5115,x:33320,y:32704,varname:node_5115,prsc:2|A-955-OUT,B-5085-OUT;n:type:ShaderForge.SFN_Posterize,id:6089,x:32839,y:32875,varname:node_6089,prsc:2|IN-2159-OUT,STPS-5151-OUT;n:type:ShaderForge.SFN_Slider,id:5151,x:32465,y:33034,ptovrint:False,ptlb:posterize,ptin:_posterize,varname:node_5151,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:50;n:type:ShaderForge.SFN_Lerp,id:4861,x:32804,y:32333,varname:node_4861,prsc:2|A-4748-OUT,B-7066-OUT,T-2831-OUT;n:type:ShaderForge.SFN_Step,id:7950,x:32300,y:32557,varname:node_7950,prsc:2|A-7782-OUT,B-4143-OUT;n:type:ShaderForge.SFN_OneMinus,id:2831,x:32882,y:32468,varname:node_2831,prsc:2|IN-5609-OUT;n:type:ShaderForge.SFN_Add,id:9668,x:31612,y:32593,varname:node_9668,prsc:2|A-8068-OUT,B-225-OUT;n:type:ShaderForge.SFN_Vector1,id:7066,x:32234,y:32413,varname:node_7066,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9982,x:31771,y:32494,varname:node_9982,prsc:2|A-6179-OUT,B-9668-OUT;n:type:ShaderForge.SFN_Step,id:7125,x:33090,y:32716,varname:node_7125,prsc:2|A-8068-OUT,B-4143-OUT;n:type:ShaderForge.SFN_Add,id:603,x:32539,y:32516,varname:node_603,prsc:2|A-7950-OUT,B-7125-OUT;n:type:ShaderForge.SFN_Clamp01,id:5609,x:32697,y:32468,varname:node_5609,prsc:2|IN-603-OUT;n:type:ShaderForge.SFN_Slider,id:6179,x:31251,y:32490,ptovrint:False,ptlb:numbertile,ptin:_numbertile,varname:node_6179,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:2;n:type:ShaderForge.SFN_HalfVector,id:9872,x:31872,y:32933,varname:node_9872,prsc:2;n:type:ShaderForge.SFN_Slider,id:4143,x:31938,y:32546,ptovrint:False,ptlb:step,ptin:_step,varname:node_4143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6,max:1;n:type:ShaderForge.SFN_Lerp,id:955,x:33170,y:32537,varname:node_955,prsc:2|A-4861-OUT,B-7066-OUT,T-2716-OUT;n:type:ShaderForge.SFN_Slider,id:2716,x:32760,y:32647,ptovrint:False,ptlb:transparency_patern,ptin:_transparency_patern,varname:node_2716,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Divide,id:9666,x:31323,y:33580,varname:node_9666,prsc:2|A-8371-OUT,B-2439-UVOUT;n:type:ShaderForge.SFN_Divide,id:4956,x:31323,y:33482,varname:node_4956,prsc:2|A-8900-OUT,B-2439-UVOUT;n:type:ShaderForge.SFN_Divide,id:6680,x:31323,y:33347,varname:node_6680,prsc:2|A-2748-OUT,B-2439-UVOUT;n:type:ShaderForge.SFN_Append,id:2748,x:31081,y:33328,varname:node_2748,prsc:2|A-9710-Y,B-9710-Z;n:type:ShaderForge.SFN_Append,id:8900,x:31081,y:33465,varname:node_8900,prsc:2|A-9710-Z,B-9710-X;n:type:ShaderForge.SFN_Append,id:8371,x:31081,y:33596,varname:node_8371,prsc:2|A-9710-X,B-9710-Y;n:type:ShaderForge.SFN_FragmentPosition,id:9710,x:30700,y:33400,varname:node_9710,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:135,x:31955,y:33296,varname:node_4042,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-6680-OUT,TEX-6199-TEX;n:type:ShaderForge.SFN_Tex2d,id:7196,x:31943,y:33415,varname:node_8299,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-4956-OUT,TEX-6199-TEX;n:type:ShaderForge.SFN_Tex2d,id:2139,x:31900,y:33638,varname:node_9737,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-9666-OUT,TEX-6199-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6199,x:31619,y:33274,ptovrint:False,ptlb:node_2993,ptin:_node_2993,varname:node_2993,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:4748,x:32300,y:33322,varname:node_4748,prsc:2,chbt:1|M-4865-R,R-135-RGB,G-7196-RGB,B-2139-RGB,BTM-4865-RGB;n:type:ShaderForge.SFN_Abs,id:1855,x:30759,y:32504,varname:node_1855,prsc:2|IN-6869-OUT;n:type:ShaderForge.SFN_Abs,id:4017,x:30782,y:32672,varname:node_4017,prsc:2|IN-9684-OUT;n:type:ShaderForge.SFN_Abs,id:5425,x:30754,y:32873,varname:node_5425,prsc:2|IN-9872-OUT;n:type:ShaderForge.SFN_Power,id:9652,x:31197,y:32777,varname:node_9652,prsc:2|VAL-5757-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_Dot,id:4305,x:31001,y:32543,varname:node_4305,prsc:2,dt:1|A-1855-OUT,B-4017-OUT;n:type:ShaderForge.SFN_Dot,id:5757,x:31013,y:32816,varname:node_5757,prsc:2,dt:1|A-4017-OUT,B-5425-OUT;n:type:ShaderForge.SFN_RemapRange,id:3252,x:31251,y:32564,varname:node_3252,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:0.8|IN-4305-OUT;n:type:ShaderForge.SFN_RemapRange,id:2913,x:31417,y:32811,varname:node_2913,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:0.8|IN-9652-OUT;n:type:ShaderForge.SFN_Multiply,id:1390,x:30749,y:32049,varname:node_1390,prsc:2|A-2913-OUT,B-3252-OUT;n:type:ShaderForge.SFN_OneMinus,id:5238,x:30973,y:32029,varname:node_5238,prsc:2|IN-1390-OUT;n:type:ShaderForge.SFN_Multiply,id:225,x:31174,y:32151,varname:node_225,prsc:2|A-5238-OUT,B-3153-OUT;n:type:ShaderForge.SFN_Vector1,id:3153,x:30918,y:32224,varname:node_3153,prsc:2,v1:2;proporder:5927-5328-4865-5151-6179-4143-2716-6199;pass:END;sub:END;*/

Shader "Shader Forge/shadowfinal" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Gloss ("Gloss", Range(0, 1)) = 0.5
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _posterize ("posterize", Range(0, 50)) = 0
        _numbertile ("numbertile", Range(0, 2)) = 0.2
        _step ("step", Range(0, 1)) = 0.6
        _transparency_patern ("transparency_patern", Range(0, 1)) = 0
        _node_2993 ("node_2993", 2D) = "white" {}
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float _posterize;
            uniform float _numbertile;
            uniform float _step;
            uniform float _transparency_patern;
            uniform sampler2D _node_2993; uniform float4 _node_2993_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float3 emissive = (_Color.rgb*UNITY_LIGHTMODEL_AMBIENT.rgb);
                float3 node_4017 = abs(normalDirection);
                float node_1700 = exp2(lerp(1,11,_Gloss));
                float node_9982 = (_numbertile*(attenuation+((1.0 - ((pow(max(0,dot(node_4017,abs(halfDirection))),node_1700)*0.5+0.3)*(max(0,dot(abs(lightDirection),node_4017))*0.5+0.3)))*2.0)));
                float node_6134 = 1.0;
                float2 node_2439_tc_rcp = float2(1.0,1.0)/float2( node_9982, node_9982 );
                float node_2439_ty = floor(node_6134 * node_2439_tc_rcp.x);
                float node_2439_tx = node_6134 - node_9982 * node_2439_ty;
                float2 node_2439 = (i.uv0 + float2(node_2439_tx, node_2439_ty)) * node_2439_tc_rcp;
                float2 node_6680 = (float2(i.posWorld.g,i.posWorld.b)/node_2439);
                float4 node_4042 = tex2D(_node_2993,TRANSFORM_TEX(node_6680, _node_2993));
                float node_7066 = 1.0;
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float3 finalColor = emissive + (lerp(lerp((lerp( _SpecColor.rgb, node_4042.rgb, _SpecColor.r.r )),float3(node_7066,node_7066,node_7066),(1.0 - saturate((step(node_7782,_step)+step(attenuation,_step))))),float3(node_7066,node_7066,node_7066),_transparency_patern)*(floor(((_Color.rgb*node_7782)+(node_7782*pow(node_7782,node_1700)*_SpecColor.rgb)) * _posterize) / (_posterize - 1)*_LightColor0.rgb*attenuation));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float _posterize;
            uniform float _numbertile;
            uniform float _step;
            uniform float _transparency_patern;
            uniform sampler2D _node_2993; uniform float4 _node_2993_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 node_4017 = abs(normalDirection);
                float node_1700 = exp2(lerp(1,11,_Gloss));
                float node_9982 = (_numbertile*(attenuation+((1.0 - ((pow(max(0,dot(node_4017,abs(halfDirection))),node_1700)*0.5+0.3)*(max(0,dot(abs(lightDirection),node_4017))*0.5+0.3)))*2.0)));
                float node_6134 = 1.0;
                float2 node_2439_tc_rcp = float2(1.0,1.0)/float2( node_9982, node_9982 );
                float node_2439_ty = floor(node_6134 * node_2439_tc_rcp.x);
                float node_2439_tx = node_6134 - node_9982 * node_2439_ty;
                float2 node_2439 = (i.uv0 + float2(node_2439_tx, node_2439_ty)) * node_2439_tc_rcp;
                float2 node_6680 = (float2(i.posWorld.g,i.posWorld.b)/node_2439);
                float4 node_4042 = tex2D(_node_2993,TRANSFORM_TEX(node_6680, _node_2993));
                float node_7066 = 1.0;
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float3 finalColor = (lerp(lerp((lerp( _SpecColor.rgb, node_4042.rgb, _SpecColor.r.r )),float3(node_7066,node_7066,node_7066),(1.0 - saturate((step(node_7782,_step)+step(attenuation,_step))))),float3(node_7066,node_7066,node_7066),_transparency_patern)*(floor(((_Color.rgb*node_7782)+(node_7782*pow(node_7782,node_1700)*_SpecColor.rgb)) * _posterize) / (_posterize - 1)*_LightColor0.rgb*attenuation));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

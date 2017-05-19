// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:34112,y:32552,varname:node_9361,prsc:2|emission-8767-OUT,custl-2512-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8068,x:33492,y:33124,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_LightColor,id:3406,x:33221,y:32886,varname:node_3406,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6869,x:31799,y:32663,varname:node_6869,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9684,x:31494,y:32862,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:9471,x:31858,y:32933,varname:node_9471,prsc:2;n:type:ShaderForge.SFN_Dot,id:7782,x:32070,y:32697,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-6869-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Dot,id:3269,x:32070,y:32871,cmnt:Blinn-Phong,varname:node_3269,prsc:2,dt:1|A-9684-OUT,B-9471-OUT;n:type:ShaderForge.SFN_Multiply,id:2746,x:32525,y:32874,cmnt:Specular Contribution,varname:node_2746,prsc:2|A-7782-OUT,B-5267-OUT,C-4865-RGB;n:type:ShaderForge.SFN_Tex2d,id:851,x:32242,y:31839,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ee7994e0a80b0f7489b37fe0215b35ff,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1941,x:32382,y:32702,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-5927-RGB,B-7782-OUT;n:type:ShaderForge.SFN_Color,id:5927,x:32261,y:32185,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Exp,id:1700,x:32070,y:33054,varname:node_1700,prsc:2,et:1|IN-9978-OUT;n:type:ShaderForge.SFN_Slider,id:5328,x:31529,y:33056,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8452743,max:1;n:type:ShaderForge.SFN_Power,id:5267,x:32320,y:32924,varname:node_5267,prsc:2|VAL-3269-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_Add,id:2159,x:32743,y:32833,cmnt:Combine,varname:node_2159,prsc:2|A-1941-OUT,B-2746-OUT;n:type:ShaderForge.SFN_Multiply,id:5085,x:33885,y:33060,cmnt:Attenuate and Color,varname:node_5085,prsc:2|A-2255-OUT,B-5901-OUT,C-7361-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:9978,x:31858,y:33056,varname:node_9978,prsc:2,a:1,b:11|IN-5328-OUT;n:type:ShaderForge.SFN_Color,id:4865,x:32331,y:33134,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:node_4865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:544,x:33000,y:32051,cmnt:Diffuse Color,varname:node_544,prsc:2|A-4419-OUT,B-5927-RGB;n:type:ShaderForge.SFN_Posterize,id:2255,x:33285,y:32760,varname:node_2255,prsc:2|IN-2159-OUT,STPS-3328-OUT;n:type:ShaderForge.SFN_Desaturate,id:5901,x:33463,y:32971,varname:node_5901,prsc:2|COL-3406-RGB,DES-1740-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3328,x:32978,y:33017,ptovrint:False,ptlb:node_3328,ptin:_node_3328,varname:node_3328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:20;n:type:ShaderForge.SFN_Multiply,id:7361,x:33701,y:33196,varname:node_7361,prsc:2|A-8068-OUT,B-5402-OUT;n:type:ShaderForge.SFN_Slider,id:1740,x:33145,y:33304,ptovrint:False,ptlb:Desaturation of the Light Color,ptin:_DesaturationoftheLightColor,varname:node_1740,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:5402,x:33385,y:33445,ptovrint:False,ptlb:node_5402,ptin:_node_5402,varname:node_5402,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.924526,max:3;n:type:ShaderForge.SFN_Tex2d,id:4042,x:31891,y:33232,varname:node_4042,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-4174-OUT,TEX-2993-TEX;n:type:ShaderForge.SFN_Multiply,id:7808,x:32832,y:32507,varname:node_7808,prsc:2|A-291-OUT,B-5884-OUT;n:type:ShaderForge.SFN_Blend,id:2512,x:33937,y:32720,varname:node_2512,prsc:2,blmd:0,clmp:False|SRC-6013-OUT,DST-9583-OUT;n:type:ShaderForge.SFN_UVTile,id:2056,x:31899,y:31923,varname:node_2056,prsc:2|WDT-2542-OUT,HGT-2542-OUT,TILE-4375-OUT;n:type:ShaderForge.SFN_Vector1,id:4375,x:31396,y:32327,varname:node_4375,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:6013,x:33754,y:32764,varname:node_6013,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.8|IN-5085-OUT;n:type:ShaderForge.SFN_Vector1,id:291,x:32620,y:32463,varname:node_291,prsc:2,v1:2;n:type:ShaderForge.SFN_Step,id:3219,x:33000,y:32248,varname:node_3219,prsc:2|A-2359-OUT,B-7808-OUT;n:type:ShaderForge.SFN_RemapRange,id:4682,x:31953,y:32493,varname:node_4682,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:0.8|IN-6630-OUT;n:type:ShaderForge.SFN_RemapRange,id:1236,x:31645,y:32484,varname:node_1236,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:0.8|IN-8869-OUT;n:type:ShaderForge.SFN_Multiply,id:701,x:31143,y:31969,varname:node_701,prsc:2|A-4682-OUT,B-1236-OUT;n:type:ShaderForge.SFN_Abs,id:5691,x:30968,y:32879,varname:node_5691,prsc:2|IN-9684-OUT;n:type:ShaderForge.SFN_Abs,id:9840,x:31136,y:33106,varname:node_9840,prsc:2|IN-9471-OUT;n:type:ShaderForge.SFN_Dot,id:7803,x:31304,y:33036,varname:node_7803,prsc:2,dt:1|A-5691-OUT,B-9840-OUT;n:type:ShaderForge.SFN_Abs,id:765,x:31098,y:32432,varname:node_765,prsc:2|IN-6869-OUT;n:type:ShaderForge.SFN_Dot,id:6630,x:31256,y:32733,varname:node_6630,prsc:2,dt:0|A-765-OUT,B-5691-OUT;n:type:ShaderForge.SFN_OneMinus,id:8353,x:31326,y:31798,varname:node_8353,prsc:2|IN-701-OUT;n:type:ShaderForge.SFN_Multiply,id:2542,x:31543,y:32127,varname:node_2542,prsc:2|A-8353-OUT,B-5355-OUT;n:type:ShaderForge.SFN_Vector1,id:5355,x:31265,y:32129,varname:node_5355,prsc:2,v1:5;n:type:ShaderForge.SFN_Power,id:8869,x:31463,y:32385,varname:node_8869,prsc:2|VAL-7803-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_Multiply,id:5506,x:30546,y:33093,varname:node_5506,prsc:2|A-5691-OUT,B-5691-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9143,x:30743,y:33251,varname:node_9143,prsc:2;n:type:ShaderForge.SFN_Append,id:2902,x:31017,y:33264,varname:node_2902,prsc:2|A-9143-Y,B-9143-Z;n:type:ShaderForge.SFN_Append,id:6151,x:31017,y:33401,varname:node_6151,prsc:2|A-9143-Z,B-9143-X;n:type:ShaderForge.SFN_Append,id:6438,x:31017,y:33532,varname:node_6438,prsc:2|A-9143-X,B-9143-Y;n:type:ShaderForge.SFN_Tex2dAsset,id:2993,x:31555,y:33210,ptovrint:False,ptlb:node_2993,ptin:_node_2993,varname:node_2993,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Divide,id:4174,x:31282,y:33227,varname:node_4174,prsc:2|A-2902-OUT,B-2056-UVOUT;n:type:ShaderForge.SFN_Divide,id:6638,x:31259,y:33418,varname:node_6638,prsc:2|A-6151-OUT,B-2056-UVOUT;n:type:ShaderForge.SFN_Divide,id:5692,x:31281,y:33620,varname:node_5692,prsc:2|A-6438-OUT,B-2056-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8299,x:31879,y:33351,varname:node_8299,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-6638-OUT,TEX-2993-TEX;n:type:ShaderForge.SFN_Tex2d,id:9737,x:31836,y:33574,varname:node_9737,prsc:2,tex:3daa84019b04aae42a38c0efd06020b3,ntxv:0,isnm:False|UVIN-5692-OUT,TEX-2993-TEX;n:type:ShaderForge.SFN_Lerp,id:7861,x:32366,y:33470,varname:node_7861,prsc:2|A-4042-RGB,B-8299-RGB,T-2486-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2486,x:30733,y:33125,varname:node_2486,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-5506-OUT;n:type:ShaderForge.SFN_Lerp,id:9972,x:31953,y:32361,varname:node_9972,prsc:2|A-7861-OUT,B-9737-RGB,T-2486-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:2359,x:32331,y:33321,varname:node_2359,prsc:2,chbt:0|M-4865-RGB,R-4042-RGB,G-8299-RGB,B-9737-RGB,BTM-4865-RGB;n:type:ShaderForge.SFN_ComponentMask,id:6371,x:33198,y:32339,varname:node_6371,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3219-OUT;n:type:ShaderForge.SFN_Desaturate,id:4419,x:32614,y:31911,varname:node_4419,prsc:2|COL-851-RGB,DES-1971-OUT;n:type:ShaderForge.SFN_Slider,id:1971,x:32226,y:32025,ptovrint:False,ptlb:desaturation diffuse,ptin:_desaturationdiffuse,varname:node_1971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:3169,x:33406,y:32485,varname:node_3169,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.8|IN-6371-OUT;n:type:ShaderForge.SFN_Lerp,id:9250,x:33803,y:32376,varname:node_9250,prsc:2|A-3169-OUT,B-544-OUT,T-3169-OUT;n:type:ShaderForge.SFN_Vector1,id:7069,x:33509,y:32708,varname:node_7069,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:9583,x:33776,y:32604,varname:node_9583,prsc:2|A-3169-OUT,B-5085-OUT,T-5085-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8767,x:34031,y:32316,ptovrint:False,ptlb:selectable,ptin:_selectable,varname:node_8767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9250-OUT,B-544-OUT;n:type:ShaderForge.SFN_Step,id:1970,x:33254,y:32564,varname:node_1970,prsc:2|A-7690-OUT,B-8068-OUT;n:type:ShaderForge.SFN_Vector1,id:7690,x:32954,y:32507,varname:node_7690,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Vector1,id:4767,x:32606,y:32267,varname:node_4767,prsc:2,v1:0.6;n:type:ShaderForge.SFN_Lerp,id:5380,x:32991,y:32560,varname:node_5380,prsc:2;n:type:ShaderForge.SFN_Append,id:6364,x:32818,y:32699,varname:node_6364,prsc:2|A-2159-OUT,B-1970-OUT;n:type:ShaderForge.SFN_Clamp01,id:5884,x:32658,y:32588,varname:node_5884,prsc:2|IN-6364-OUT;n:type:ShaderForge.SFN_Add,id:1499,x:33012,y:32699,varname:node_1499,prsc:2|A-2159-OUT,B-1970-OUT;proporder:851-5927-5328-4865-3328-1740-5402-2993-1971-8767;pass:END;sub:END;*/

Shader "Shader Forge/PaternShadows" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Gloss ("Gloss", Range(0, 1)) = 0.8452743
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _node_3328 ("node_3328", Float ) = 20
        _DesaturationoftheLightColor ("Desaturation of the Light Color", Range(0, 1)) = 1
        _node_5402 ("node_5402", Range(0, 3)) = 1.924526
        _node_2993 ("node_2993", 2D) = "white" {}
        _desaturationdiffuse ("desaturation diffuse", Range(0, 1)) = 0
        [MaterialToggle] _selectable ("selectable", Float ) = 0
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
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float _node_3328;
            uniform float _DesaturationoftheLightColor;
            uniform float _node_5402;
            uniform sampler2D _node_2993; uniform float4 _node_2993_ST;
            uniform float _desaturationdiffuse;
            uniform fixed _selectable;
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
                float3 node_5691 = abs(normalDirection);
                float node_1700 = exp2(lerp(1,11,_Gloss));
                float node_2542 = ((1.0 - ((dot(abs(lightDirection),node_5691)*0.5+0.3)*(pow(max(0,dot(node_5691,abs(halfDirection))),node_1700)*0.5+0.3)))*5.0);
                float node_4375 = 1.0;
                float2 node_2056_tc_rcp = float2(1.0,1.0)/float2( node_2542, node_2542 );
                float node_2056_ty = floor(node_4375 * node_2056_tc_rcp.x);
                float node_2056_tx = node_4375 - node_2542 * node_2056_ty;
                float2 node_2056 = (i.uv0 + float2(node_2056_tx, node_2056_ty)) * node_2056_tc_rcp;
                float2 node_4174 = (float2(i.posWorld.g,i.posWorld.b)/node_2056);
                float4 node_4042 = tex2D(_node_2993,TRANSFORM_TEX(node_4174, _node_2993));
                float2 node_6638 = (float2(i.posWorld.b,i.posWorld.r)/node_2056);
                float4 node_8299 = tex2D(_node_2993,TRANSFORM_TEX(node_6638, _node_2993));
                float2 node_5692 = (float2(i.posWorld.r,i.posWorld.g)/node_2056);
                float4 node_9737 = tex2D(_node_2993,TRANSFORM_TEX(node_5692, _node_2993));
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float3 node_2159 = ((_Color.rgb*node_7782)+(node_7782*pow(max(0,dot(normalDirection,halfDirection)),node_1700)*_SpecColor.rgb)); // Combine
                float node_1970 = step(0.8,attenuation);
                float node_3169 = (step((_SpecColor.rgb.r*node_4042.rgb + _SpecColor.rgb.g*node_8299.rgb + _SpecColor.rgb.b*node_9737.rgb),(2.0*saturate(float4(node_2159,node_1970)))).r*0.8+0.0);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 node_544 = (lerp(_Diffuse_var.rgb,dot(_Diffuse_var.rgb,float3(0.3,0.59,0.11)),_desaturationdiffuse)*_Color.rgb); // Diffuse Color
                float3 emissive = lerp( lerp(float3(node_3169,node_3169,node_3169),node_544,node_3169), node_544, _selectable );
                float3 node_5085 = (floor(node_2159 * _node_3328) / (_node_3328 - 1)*lerp(_LightColor0.rgb,dot(_LightColor0.rgb,float3(0.3,0.59,0.11)),_DesaturationoftheLightColor)*(attenuation*_node_5402)); // Attenuate and Color
                float3 finalColor = emissive + min((node_5085*0.8+0.0),lerp(float3(node_3169,node_3169,node_3169),node_5085,node_5085));
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
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float _node_3328;
            uniform float _DesaturationoftheLightColor;
            uniform float _node_5402;
            uniform sampler2D _node_2993; uniform float4 _node_2993_ST;
            uniform float _desaturationdiffuse;
            uniform fixed _selectable;
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
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float node_1700 = exp2(lerp(1,11,_Gloss));
                float3 node_2159 = ((_Color.rgb*node_7782)+(node_7782*pow(max(0,dot(normalDirection,halfDirection)),node_1700)*_SpecColor.rgb)); // Combine
                float3 node_5085 = (floor(node_2159 * _node_3328) / (_node_3328 - 1)*lerp(_LightColor0.rgb,dot(_LightColor0.rgb,float3(0.3,0.59,0.11)),_DesaturationoftheLightColor)*(attenuation*_node_5402)); // Attenuate and Color
                float3 node_5691 = abs(normalDirection);
                float node_2542 = ((1.0 - ((dot(abs(lightDirection),node_5691)*0.5+0.3)*(pow(max(0,dot(node_5691,abs(halfDirection))),node_1700)*0.5+0.3)))*5.0);
                float node_4375 = 1.0;
                float2 node_2056_tc_rcp = float2(1.0,1.0)/float2( node_2542, node_2542 );
                float node_2056_ty = floor(node_4375 * node_2056_tc_rcp.x);
                float node_2056_tx = node_4375 - node_2542 * node_2056_ty;
                float2 node_2056 = (i.uv0 + float2(node_2056_tx, node_2056_ty)) * node_2056_tc_rcp;
                float2 node_4174 = (float2(i.posWorld.g,i.posWorld.b)/node_2056);
                float4 node_4042 = tex2D(_node_2993,TRANSFORM_TEX(node_4174, _node_2993));
                float2 node_6638 = (float2(i.posWorld.b,i.posWorld.r)/node_2056);
                float4 node_8299 = tex2D(_node_2993,TRANSFORM_TEX(node_6638, _node_2993));
                float2 node_5692 = (float2(i.posWorld.r,i.posWorld.g)/node_2056);
                float4 node_9737 = tex2D(_node_2993,TRANSFORM_TEX(node_5692, _node_2993));
                float node_1970 = step(0.8,attenuation);
                float node_3169 = (step((_SpecColor.rgb.r*node_4042.rgb + _SpecColor.rgb.g*node_8299.rgb + _SpecColor.rgb.b*node_9737.rgb),(2.0*saturate(float4(node_2159,node_1970)))).r*0.8+0.0);
                float3 finalColor = min((node_5085*0.8+0.0),lerp(float3(node_3169,node_3169,node_3169),node_5085,node_5085));
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

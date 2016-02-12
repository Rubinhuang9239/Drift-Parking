xof 0303txt 0032

// DirectX 9.0 file
// Creator: Ultimate Unwrap3D Pro v3.26
// Website: http://www.unwrap3d.com
// Time: Thu Mar 31 19:56:32 2011

// Start of Templates

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template FVFData {
 <b6e70a0e-8ef9-4e83-94ad-ecc8b0c04897>
 DWORD dwFVF;
 DWORD nDWords;
 array DWORD data[nDWords];
}

template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template FrameTransformMatrix {
 <F6F23F41-7686-11cf-8F52-0040333594A3>
 Matrix4x4 frameMatrix;
}

template Frame {
 <3D82AB46-62DA-11cf-AB39-0020AF71E433>
 [...]
}

template FloatKeys {
 <10DD46A9-775B-11cf-8F52-0040333594A3>
 DWORD nValues;
 array FLOAT values[nValues];
}

template TimedFloatKeys {
 <F406B180-7B3B-11cf-8F52-0040333594A3>
 DWORD time;
 FloatKeys tfkeys;
}

template AnimationKey {
 <10DD46A8-775B-11cf-8F52-0040333594A3>
 DWORD keyType;
 DWORD nKeys;
 array TimedFloatKeys keys[nKeys];
}

template AnimationOptions {
 <E2BF56C0-840F-11cf-8F52-0040333594A3>
 DWORD openclosed;
 DWORD positionquality;
}

template Animation {
 <3D82AB4F-62DA-11cf-AB39-0020AF71E433>
 [...]
}

template AnimationSet {
 <3D82AB50-62DA-11cf-AB39-0020AF71E433>
 [Animation]
}

template XSkinMeshHeader {
 <3CF169CE-FF7C-44ab-93C0-F78F62D172E2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template SkinWeights {
 <6F0D123B-BAD2-4167-A0D0-80224F25FABB>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}

template AnimTicksPerSecond {
 <9E415A43-7BA6-4a73-8743-B73D47E88476>
 DWORD AnimTicksPerSecond;
}

AnimTicksPerSecond {
 30;
}

// Start of Frames

Frame BarbedWire {
   FrameTransformMatrix {
    1.000000, 0.000000, 0.000000, 0.000000,
    0.000000, 1.000000, 0.000000, 0.000000,
    0.000000, 0.000000, 1.000000, 0.000000,
    0.000000, 0.000000, 0.000000, 1.000000;;
   }

   Mesh BarbedWire {
    92;
    3.529990; 9.333000; 10.134050;,
    1.187420; 12.348694; 10.300970;,
    2.257070; 8.591301; -1.845500;,
    -0.085500; 11.607094; -1.678570;,
    3.173270; 6.403694; 10.159471;,
    1.900350; 5.661995; -1.820080;,
    3.776500; 9.035599; 21.855551;,
    1.433940; 12.051300; 22.022449;,
    2.415110; 9.191399; 15.874550;,
    0.072540; 12.207199; 16.041451;,
    3.419780; 6.106300; 21.880951;,
    2.058390; 6.262100; 15.899950;,
    3.529990; 9.333000; 10.134050;,
    -1.413280; 9.543900; -22.836750;,
    -0.358800; 6.254997; -19.966949;,
    -4.293680; 12.200096; -19.686550;,
    -3.745505; 12.965195; -31.017950;,
    -5.488800; 11.432999; -50.014648;,
    -0.865110; 10.309097; -34.168152;,
    -2.399600; 8.782997; -50.234749;,
    0.189370; 5.970200; -31.298349;,
    -1.553920; 5.487900; -50.295052;,
    5.268340; 5.918198; 29.084751;,
    5.298161; 5.487900; 45.862549;,
    4.422661; 10.488998; 29.144951;,
    4.452471; 8.782997; 45.922852;,
    1.333460; 13.139000; 29.365150;,
    1.363280; 11.432999; 46.142952;,
    1.953550; 2.755295; -1.823870;,
    -0.085500; 0.154694; -1.678570;,
    3.252200; 2.706497; 10.076321;,
    1.178080; 0.115700; 10.169790;,
    2.153110; 2.683899; 15.828450;,
    0.064640; 0.097794; 15.930551;,
    3.532470; 2.658600; 21.822050;,
    1.427630; 0.078094; 21.933849;,
    -0.261480; 2.682198; -20.011850;,
    -2.349280; 0.096298; -19.890551;,
    0.318010; 2.635994; -31.366751;,
    -1.363270; 2.554695; -50.308647;,
    -1.801890; 0.060394; -31.261450;,
    -3.539761; 0.000000; -50.153549;,
    5.403581; 2.627701; 29.040350;,
    3.278110; 0.054398; 29.164650;,
    5.488800; 2.554695; 45.849052;,
    3.312310; 0.000000; 46.004150;,
    -5.289920; 9.333000; -10.467950;,
    -2.941417; 12.348694; -10.467950;,
    -2.920289; 8.591301; 1.710807;,
    -0.571780; 11.607094; 1.710807;,
    -4.932300; 6.403694; -10.467950;,
    -2.562660; 5.661995; 1.710807;,
    -2.751240; 9.035599; -22.038250;,
    -0.402730; 12.051300; -22.038250;,
    -1.818410; 9.191399; -15.975649;,
    0.530090; 12.207199; -15.975649;,
    -2.393610; 6.106300; -22.038250;,
    -1.460790; 6.262100; -15.975649;,
    -5.289920; 9.333000; -10.467950;,
    -0.751250; 9.543900; 22.909851;,
    -1.599080; 6.254997; 19.972351;,
    2.345780; 12.200096; 19.972351;,
    0.993570; 13.190994; 31.236050;,
    1.382200; 11.432999; 50.308647;,
    -2.103450; 9.259094; 34.173553;,
    -1.714830; 8.782997; 50.308647;,
    -2.951281; 5.970200; 31.236050;,
    -2.562660; 5.487900; 50.308647;,
    -3.725467; 5.918198; -29.355249;,
    -2.562660; 5.487900; -46.092751;,
    -2.877637; 10.263199; -29.355249;,
    -1.714830; 8.782997; -46.092751;,
    0.219390; 12.913200; -29.355249;,
    1.382200; 11.432999; -46.092751;,
    -2.616000; 2.755295; 1.710807;,
    -0.571780; 0.154694; 1.710807;,
    -5.016940; 3.617996; -10.390650;,
    -2.941418; 1.027199; -10.336450;,
    -1.560350; 2.683899; -15.911049;,
    0.530090; 0.097794; -15.864450;,
    -2.510210; 2.658600; -21.987551;,
    -0.402730; 0.078094; -21.949450;,
    -1.699350; 3.720398; 20.010250;,
    0.391800; 1.134499; 20.037550;,
    -3.084451; 2.635994; 31.295151;,
    -2.753790; 2.554695; 50.308647;,
    -0.962430; 0.060394; 31.340851;,
    -0.571780; 0.000000; 50.308647;,
    -3.863513; 2.627701; -29.320549;,
    -1.734590; 0.054398; -29.293449;,
    -2.753790; 2.554695; -46.092751;,
    -0.571780; 0.000000; -46.092751;;
    128;
    3;0, 1, 2;,
    3;1, 3, 2;,
    3;0, 2, 4;,
    3;2, 5, 4;,
    3;6, 7, 8;,
    3;7, 9, 8;,
    3;6, 8, 10;,
    3;8, 11, 10;,
    3;8, 9, 12;,
    3;9, 1, 12;,
    3;8, 12, 11;,
    3;12, 4, 11;,
    3;13, 14, 2;,
    3;14, 5, 2;,
    3;13, 2, 15;,
    3;2, 3, 15;,
    3;16, 17, 18;,
    3;17, 19, 18;,
    3;18, 19, 20;,
    3;19, 21, 20;,
    3;18, 20, 13;,
    3;20, 14, 13;,
    3;18, 13, 16;,
    3;13, 15, 16;,
    3;22, 23, 24;,
    3;23, 25, 24;,
    3;24, 25, 26;,
    3;25, 27, 26;,
    3;24, 26, 6;,
    3;26, 7, 6;,
    3;24, 6, 22;,
    3;6, 10, 22;,
    3;28, 29, 30;,
    3;29, 31, 30;,
    3;28, 30, 5;,
    3;30, 4, 5;,
    3;30, 31, 32;,
    3;31, 33, 32;,
    3;30, 32, 4;,
    3;32, 11, 4;,
    3;32, 33, 34;,
    3;33, 35, 34;,
    3;32, 34, 11;,
    3;34, 10, 11;,
    3;36, 37, 28;,
    3;37, 29, 28;,
    3;36, 28, 14;,
    3;28, 5, 14;,
    3;20, 21, 38;,
    3;21, 39, 38;,
    3;38, 39, 40;,
    3;39, 41, 40;,
    3;38, 40, 36;,
    3;40, 37, 36;,
    3;38, 36, 20;,
    3;36, 14, 20;,
    3;34, 35, 42;,
    3;35, 43, 42;,
    3;34, 42, 10;,
    3;42, 22, 10;,
    3;42, 43, 44;,
    3;43, 45, 44;,
    3;42, 44, 22;,
    3;44, 23, 22;,
    3;46, 47, 48;,
    3;47, 49, 48;,
    3;46, 48, 50;,
    3;48, 51, 50;,
    3;52, 53, 54;,
    3;53, 55, 54;,
    3;52, 54, 56;,
    3;54, 57, 56;,
    3;54, 55, 58;,
    3;55, 47, 58;,
    3;54, 58, 57;,
    3;58, 50, 57;,
    3;59, 60, 48;,
    3;60, 51, 48;,
    3;59, 48, 61;,
    3;48, 49, 61;,
    3;62, 63, 64;,
    3;63, 65, 64;,
    3;64, 65, 66;,
    3;65, 67, 66;,
    3;64, 66, 59;,
    3;66, 60, 59;,
    3;64, 59, 62;,
    3;59, 61, 62;,
    3;68, 69, 70;,
    3;69, 71, 70;,
    3;70, 71, 72;,
    3;71, 73, 72;,
    3;70, 72, 52;,
    3;72, 53, 52;,
    3;70, 52, 68;,
    3;52, 56, 68;,
    3;74, 75, 76;,
    3;75, 77, 76;,
    3;74, 76, 51;,
    3;76, 50, 51;,
    3;76, 77, 78;,
    3;77, 79, 78;,
    3;76, 78, 50;,
    3;78, 57, 50;,
    3;78, 79, 80;,
    3;79, 81, 80;,
    3;78, 80, 57;,
    3;80, 56, 57;,
    3;82, 83, 74;,
    3;83, 75, 74;,
    3;82, 74, 60;,
    3;74, 51, 60;,
    3;66, 67, 84;,
    3;67, 85, 84;,
    3;84, 85, 86;,
    3;85, 87, 86;,
    3;84, 86, 82;,
    3;86, 83, 82;,
    3;84, 82, 66;,
    3;82, 60, 66;,
    3;80, 81, 88;,
    3;81, 89, 88;,
    3;80, 88, 56;,
    3;88, 68, 56;,
    3;88, 89, 90;,
    3;89, 91, 90;,
    3;88, 90, 68;,
    3;90, 69, 68;;

   MeshNormals {
    92;
    -0.956671; -0.266133; 0.118128;,
    -0.790143; -0.612483; -0.023217;,
    -0.930221; -0.348001; 0.116553;,
    -0.781411; -0.613345; 0.114912;,
    -0.997899; 0.048744; -0.042673;,
    -0.993264; -0.033398; 0.110960;,
    -0.937255; -0.313300; 0.152961;,
    -0.713035; -0.688447; 0.132746;,
    -0.963437; -0.267804; 0.008370;,
    -0.789817; -0.613334; -0.003214;,
    -0.980642; 0.040777; 0.191515;,
    -0.998773; 0.045857; 0.018709;,
    -0.946823; -0.259460; -0.190280;,
    -0.888544; -0.458042; 0.026196;,
    -0.990766; -0.130625; 0.036319;,
    -0.756476; -0.653874; 0.013873;,
    -0.686348; -0.727013; 0.019457;,
    -0.641449; -0.757725; 0.119980;,
    -0.859357; -0.510507; 0.029789;,
    -0.840399; -0.527723; 0.123441;,
    -0.987991; -0.151653; 0.029596;,
    -0.981936; -0.157658; 0.104620;,
    -0.995032; -0.059672; 0.079692;,
    -0.987538; -0.157378; 0.000063;,
    -0.892783; -0.449853; 0.023873;,
    -0.849693; -0.525600; -0.042029;,
    -0.650448; -0.759420; 0.014076;,
    -0.652327; -0.754165; -0.075526;,
    -0.941166; 0.320006; 0.108646;,
    -0.777128; 0.622916; 0.089707;,
    -0.947250; 0.318233; -0.038020;,
    -0.783561; 0.620520; -0.031421;,
    -0.947290; 0.319914; 0.017256;,
    -0.778862; 0.627042; 0.013862;,
    -0.922983; 0.311863; 0.225487;,
    -0.759225; 0.623882; 0.185333;,
    -0.945004; 0.325350; 0.033390;,
    -0.774098; 0.632470; 0.027473;,
    -0.947070; 0.320518; 0.018089;,
    -0.945150; 0.315413; 0.084891;,
    -0.766063; 0.642640; 0.012660;,
    -0.757685; 0.649429; 0.064465;,
    -0.942334; 0.311400; 0.122628;,
    -0.766929; 0.633891; 0.100012;,
    -0.951468; 0.307716; 0.004519;,
    -0.770915; 0.636928; 0.003623;,
    0.944394; -0.261258; -0.199660;,
    0.780962; -0.608172; 0.142218;,
    0.929862; -0.346469; -0.123763;,
    0.783225; -0.609936; -0.120568;,
    0.981908; 0.046566; 0.183542;,
    0.992154; -0.036907; -0.119450;,
    0.946140; -0.313586; -0.080521;,
    0.721275; -0.689102; -0.070005;,
    0.941593; -0.265992; 0.206520;,
    0.775602; -0.603997; 0.183383;,
    0.991661; 0.040773; -0.122254;,
    0.978424; 0.046286; 0.201355;,
    0.819458; -0.235428; 0.522553;,
    0.873337; -0.486781; 0.018070;,
    0.987797; -0.152316; 0.032512;,
    0.739306; -0.673348; 0.005361;,
    0.667847; -0.744236; -0.009669;,
    0.647898; -0.757192; -0.082995;,
    0.842642; -0.538290; 0.014073;,
    0.847356; -0.527669; -0.059601;,
    0.983939; -0.173289; 0.042835;,
    0.987129; -0.157725; -0.026433;,
    0.998171; -0.059671; -0.009712;,
    0.985045; -0.157379; 0.070130;,
    0.892022; -0.450014; 0.042248;,
    0.844907; -0.526036; 0.097048;,
    0.649651; -0.759240; 0.038831;,
    0.646076; -0.755062; 0.111660;,
    0.941754; 0.316249; -0.114393;,
    0.778780; 0.620548; -0.091773;,
    0.932345; 0.322729; 0.163029;,
    0.775179; 0.618791; 0.127260;,
    0.930274; 0.324328; 0.171471;,
    0.771912; 0.623989; 0.121611;,
    0.936675; 0.311864; -0.159313;,
    0.770477; 0.623883; -0.130900;,
    0.945940; 0.321971; 0.039135;,
    0.773657; 0.632424; 0.038667;,
    0.946224; 0.317152; 0.063829;,
    0.948793; 0.315414; -0.017496;,
    0.763512; 0.641926; 0.070575;,
    0.760351; 0.649429; -0.010446;,
    0.948666; 0.311400; -0.055338;,
    0.772097; 0.633892; -0.045248;,
    0.949383; 0.307714; 0.063121;,
    0.769224; 0.636927; 0.051182;;
    128;
    3;0, 1, 2;,
    3;1, 3, 2;,
    3;0, 2, 4;,
    3;2, 5, 4;,
    3;6, 7, 8;,
    3;7, 9, 8;,
    3;6, 8, 10;,
    3;8, 11, 10;,
    3;8, 9, 12;,
    3;9, 1, 12;,
    3;8, 12, 11;,
    3;12, 4, 11;,
    3;13, 14, 2;,
    3;14, 5, 2;,
    3;13, 2, 15;,
    3;2, 3, 15;,
    3;16, 17, 18;,
    3;17, 19, 18;,
    3;18, 19, 20;,
    3;19, 21, 20;,
    3;18, 20, 13;,
    3;20, 14, 13;,
    3;18, 13, 16;,
    3;13, 15, 16;,
    3;22, 23, 24;,
    3;23, 25, 24;,
    3;24, 25, 26;,
    3;25, 27, 26;,
    3;24, 26, 6;,
    3;26, 7, 6;,
    3;24, 6, 22;,
    3;6, 10, 22;,
    3;28, 29, 30;,
    3;29, 31, 30;,
    3;28, 30, 5;,
    3;30, 4, 5;,
    3;30, 31, 32;,
    3;31, 33, 32;,
    3;30, 32, 4;,
    3;32, 11, 4;,
    3;32, 33, 34;,
    3;33, 35, 34;,
    3;32, 34, 11;,
    3;34, 10, 11;,
    3;36, 37, 28;,
    3;37, 29, 28;,
    3;36, 28, 14;,
    3;28, 5, 14;,
    3;20, 21, 38;,
    3;21, 39, 38;,
    3;38, 39, 40;,
    3;39, 41, 40;,
    3;38, 40, 36;,
    3;40, 37, 36;,
    3;38, 36, 20;,
    3;36, 14, 20;,
    3;34, 35, 42;,
    3;35, 43, 42;,
    3;34, 42, 10;,
    3;42, 22, 10;,
    3;42, 43, 44;,
    3;43, 45, 44;,
    3;42, 44, 22;,
    3;44, 23, 22;,
    3;46, 47, 48;,
    3;47, 49, 48;,
    3;46, 48, 50;,
    3;48, 51, 50;,
    3;52, 53, 54;,
    3;53, 55, 54;,
    3;52, 54, 56;,
    3;54, 57, 56;,
    3;54, 55, 58;,
    3;55, 47, 58;,
    3;54, 58, 57;,
    3;58, 50, 57;,
    3;59, 60, 48;,
    3;60, 51, 48;,
    3;59, 48, 61;,
    3;48, 49, 61;,
    3;62, 63, 64;,
    3;63, 65, 64;,
    3;64, 65, 66;,
    3;65, 67, 66;,
    3;64, 66, 59;,
    3;66, 60, 59;,
    3;64, 59, 62;,
    3;59, 61, 62;,
    3;68, 69, 70;,
    3;69, 71, 70;,
    3;70, 71, 72;,
    3;71, 73, 72;,
    3;70, 72, 52;,
    3;72, 53, 52;,
    3;70, 52, 68;,
    3;52, 56, 68;,
    3;74, 75, 76;,
    3;75, 77, 76;,
    3;74, 76, 51;,
    3;76, 50, 51;,
    3;76, 77, 78;,
    3;77, 79, 78;,
    3;76, 78, 50;,
    3;78, 57, 50;,
    3;78, 79, 80;,
    3;79, 81, 80;,
    3;78, 80, 57;,
    3;80, 56, 57;,
    3;82, 83, 74;,
    3;83, 75, 74;,
    3;82, 74, 60;,
    3;74, 51, 60;,
    3;66, 67, 84;,
    3;67, 85, 84;,
    3;84, 85, 86;,
    3;85, 87, 86;,
    3;84, 86, 82;,
    3;86, 83, 82;,
    3;84, 82, 66;,
    3;82, 60, 66;,
    3;80, 81, 88;,
    3;81, 89, 88;,
    3;80, 88, 56;,
    3;88, 68, 56;,
    3;88, 89, 90;,
    3;89, 91, 90;,
    3;88, 90, 68;,
    3;90, 69, 68;;
   }

   MeshTextureCoords {
    92;
    0.625017; 0.232393;,
    0.625017; 0.001132;,
    0.501690; 0.226987;,
    0.501690; 0.001132;,
    0.625017; 0.457022;,
    0.501690; 0.446365;,
    0.742182; 0.237528;,
    0.742182; 0.001132;,
    0.680789; 0.234837;,
    0.680789; 0.001132;,
    0.742182; 0.467146;,
    0.680789; 0.461841;,
    0.625017; 0.232392;,
    0.316766; 0.206603;,
    0.316766; 0.462083;,
    0.316766; 0.001132;,
    0.202705; 0.001132;,
    0.009569; 0.001132;,
    0.202705; 0.210924;,
    0.009569; 0.218242;,
    0.202705; 0.471778;,
    0.009569; 0.488194;,
    0.816276; 0.473548;,
    0.985767; 0.488194;,
    0.816276; 0.211714;,
    0.985767; 0.218242;,
    0.816276; 0.001132;,
    0.985767; 0.001132;,
    0.501690; 0.763875;,
    0.501690; 0.972311;,
    0.624234; 0.759997;,
    0.623685; 0.972311;,
    0.680136; 0.758156;,
    0.679663; 0.972311;,
    0.741668; 0.756060;,
    0.741283; 0.972311;,
    0.316383; 0.758078;,
    0.316106; 0.972311;,
    0.202107; 0.754165;,
    0.009569; 0.746946;,
    0.201645; 0.972311;,
    0.009569; 0.972311;,
    0.815925; 0.753428;,
    0.815651; 0.972311;,
    0.985767; 0.746946;,
    0.985767; 0.972311;,
    0.625017; 0.232393;,
    0.625017; 0.001132;,
    0.501690; 0.226987;,
    0.501690; 0.001132;,
    0.625017; 0.457022;,
    0.501690; 0.446365;,
    0.742182; 0.237528;,
    0.742182; 0.001132;,
    0.680789; 0.234837;,
    0.680789; 0.001132;,
    0.742182; 0.467146;,
    0.680789; 0.461841;,
    0.625017; 0.232392;,
    0.316766; 0.206603;,
    0.316766; 0.462083;,
    0.316766; 0.001132;,
    0.202705; 0.001132;,
    0.009569; 0.001132;,
    0.202705; 0.210924;,
    0.009569; 0.218242;,
    0.202705; 0.471778;,
    0.009569; 0.488194;,
    0.816276; 0.473548;,
    0.985767; 0.488194;,
    0.816276; 0.211714;,
    0.985767; 0.218242;,
    0.816276; 0.001132;,
    0.985767; 0.001132;,
    0.501690; 0.763875;,
    0.501690; 0.972311;,
    0.624234; 0.759997;,
    0.623685; 0.972311;,
    0.680136; 0.758156;,
    0.679663; 0.972311;,
    0.741668; 0.756060;,
    0.741283; 0.972311;,
    0.316383; 0.758078;,
    0.316106; 0.972311;,
    0.202107; 0.754165;,
    0.009569; 0.746946;,
    0.201645; 0.972311;,
    0.009569; 0.972311;,
    0.815925; 0.753428;,
    0.815651; 0.972311;,
    0.985767; 0.746946;,
    0.985767; 0.972311;;
   }

   MeshVertexColors {
    92;
    0; 1.000000; 1.000000; 1.000000; 1.000000;,
    1; 1.000000; 1.000000; 1.000000; 1.000000;,
    2; 1.000000; 1.000000; 1.000000; 1.000000;,
    3; 1.000000; 1.000000; 1.000000; 1.000000;,
    4; 1.000000; 1.000000; 1.000000; 1.000000;,
    5; 1.000000; 1.000000; 1.000000; 1.000000;,
    6; 1.000000; 1.000000; 1.000000; 1.000000;,
    7; 1.000000; 1.000000; 1.000000; 1.000000;,
    8; 1.000000; 1.000000; 1.000000; 1.000000;,
    9; 1.000000; 1.000000; 1.000000; 1.000000;,
    10; 1.000000; 1.000000; 1.000000; 1.000000;,
    11; 1.000000; 1.000000; 1.000000; 1.000000;,
    12; 1.000000; 1.000000; 1.000000; 1.000000;,
    13; 1.000000; 1.000000; 1.000000; 1.000000;,
    14; 1.000000; 1.000000; 1.000000; 1.000000;,
    15; 1.000000; 1.000000; 1.000000; 1.000000;,
    16; 1.000000; 1.000000; 1.000000; 1.000000;,
    17; 1.000000; 1.000000; 1.000000; 1.000000;,
    18; 1.000000; 1.000000; 1.000000; 1.000000;,
    19; 1.000000; 1.000000; 1.000000; 1.000000;,
    20; 1.000000; 1.000000; 1.000000; 1.000000;,
    21; 1.000000; 1.000000; 1.000000; 1.000000;,
    22; 1.000000; 1.000000; 1.000000; 1.000000;,
    23; 1.000000; 1.000000; 1.000000; 1.000000;,
    24; 1.000000; 1.000000; 1.000000; 1.000000;,
    25; 1.000000; 1.000000; 1.000000; 1.000000;,
    26; 1.000000; 1.000000; 1.000000; 1.000000;,
    27; 1.000000; 1.000000; 1.000000; 1.000000;,
    28; 1.000000; 1.000000; 1.000000; 1.000000;,
    29; 1.000000; 1.000000; 1.000000; 1.000000;,
    30; 1.000000; 1.000000; 1.000000; 1.000000;,
    31; 1.000000; 1.000000; 1.000000; 1.000000;,
    32; 1.000000; 1.000000; 1.000000; 1.000000;,
    33; 1.000000; 1.000000; 1.000000; 1.000000;,
    34; 1.000000; 1.000000; 1.000000; 1.000000;,
    35; 1.000000; 1.000000; 1.000000; 1.000000;,
    36; 1.000000; 1.000000; 1.000000; 1.000000;,
    37; 1.000000; 1.000000; 1.000000; 1.000000;,
    38; 1.000000; 1.000000; 1.000000; 1.000000;,
    39; 1.000000; 1.000000; 1.000000; 1.000000;,
    40; 1.000000; 1.000000; 1.000000; 1.000000;,
    41; 1.000000; 1.000000; 1.000000; 1.000000;,
    42; 1.000000; 1.000000; 1.000000; 1.000000;,
    43; 1.000000; 1.000000; 1.000000; 1.000000;,
    44; 1.000000; 1.000000; 1.000000; 1.000000;,
    45; 1.000000; 1.000000; 1.000000; 1.000000;,
    46; 1.000000; 1.000000; 1.000000; 1.000000;,
    47; 1.000000; 1.000000; 1.000000; 1.000000;,
    48; 1.000000; 1.000000; 1.000000; 1.000000;,
    49; 1.000000; 1.000000; 1.000000; 1.000000;,
    50; 1.000000; 1.000000; 1.000000; 1.000000;,
    51; 1.000000; 1.000000; 1.000000; 1.000000;,
    52; 1.000000; 1.000000; 1.000000; 1.000000;,
    53; 1.000000; 1.000000; 1.000000; 1.000000;,
    54; 1.000000; 1.000000; 1.000000; 1.000000;,
    55; 1.000000; 1.000000; 1.000000; 1.000000;,
    56; 1.000000; 1.000000; 1.000000; 1.000000;,
    57; 1.000000; 1.000000; 1.000000; 1.000000;,
    58; 1.000000; 1.000000; 1.000000; 1.000000;,
    59; 1.000000; 1.000000; 1.000000; 1.000000;,
    60; 1.000000; 1.000000; 1.000000; 1.000000;,
    61; 1.000000; 1.000000; 1.000000; 1.000000;,
    62; 1.000000; 1.000000; 1.000000; 1.000000;,
    63; 1.000000; 1.000000; 1.000000; 1.000000;,
    64; 1.000000; 1.000000; 1.000000; 1.000000;,
    65; 1.000000; 1.000000; 1.000000; 1.000000;,
    66; 1.000000; 1.000000; 1.000000; 1.000000;,
    67; 1.000000; 1.000000; 1.000000; 1.000000;,
    68; 1.000000; 1.000000; 1.000000; 1.000000;,
    69; 1.000000; 1.000000; 1.000000; 1.000000;,
    70; 1.000000; 1.000000; 1.000000; 1.000000;,
    71; 1.000000; 1.000000; 1.000000; 1.000000;,
    72; 1.000000; 1.000000; 1.000000; 1.000000;,
    73; 1.000000; 1.000000; 1.000000; 1.000000;,
    74; 1.000000; 1.000000; 1.000000; 1.000000;,
    75; 1.000000; 1.000000; 1.000000; 1.000000;,
    76; 1.000000; 1.000000; 1.000000; 1.000000;,
    77; 1.000000; 1.000000; 1.000000; 1.000000;,
    78; 1.000000; 1.000000; 1.000000; 1.000000;,
    79; 1.000000; 1.000000; 1.000000; 1.000000;,
    80; 1.000000; 1.000000; 1.000000; 1.000000;,
    81; 1.000000; 1.000000; 1.000000; 1.000000;,
    82; 1.000000; 1.000000; 1.000000; 1.000000;,
    83; 1.000000; 1.000000; 1.000000; 1.000000;,
    84; 1.000000; 1.000000; 1.000000; 1.000000;,
    85; 1.000000; 1.000000; 1.000000; 1.000000;,
    86; 1.000000; 1.000000; 1.000000; 1.000000;,
    87; 1.000000; 1.000000; 1.000000; 1.000000;,
    88; 1.000000; 1.000000; 1.000000; 1.000000;,
    89; 1.000000; 1.000000; 1.000000; 1.000000;,
    90; 1.000000; 1.000000; 1.000000; 1.000000;,
    91; 1.000000; 1.000000; 1.000000; 1.000000;;
   }

   MeshMaterialList {
    1;
    128;
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0;

    Material BarbedWire {
     1.000000; 1.000000; 1.000000; 1.000000;;
     128.000000;
     1.000000; 1.000000; 1.000000;;
     0.000000; 0.000000; 0.000000;;

     TextureFilename {
      "BarbedWire.dds";
     }
    }

   }
  }
}

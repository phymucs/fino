Merge "prism.brep";
Mesh.CharacteristicLengthFactor = 0.36;

Physical Surface("xy", 1) = {5};
Physical Surface("yz", 2) = {1};
Physical Surface("zx", 3) = {3};
Physical Surface(10) = {2,4,6};

Physical Volume("bulk") = {1};
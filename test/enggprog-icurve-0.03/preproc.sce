//pre-processor for icurve.sce.
//generate the input matrices and stores in var01.bin


//input variables for pframem.sce
//for test

// units = inch - kips
clc
close
clear

d1 = 12;  // width of section
d2 = 20;  // height of section
d3 = 2.5; // cover c/c

fcp = 4000;    		// compressive strength of concrete
fy = 60000;   		// yeild strength of steel rebar
E = 29000000; 		// modulus of elasticity of steel rebar

s = [2.5 6 9.5]; 	// spacing of each rebar column from right edge of section
n = [3 2 3];		// # of rebar in each column from right edge of section
Ab = [1 1 1];		// Area of rebar column from right edge of section


//store to var01.bin
fid = mopen('var01.bin','wb');
save(fid, d1, d2, d3, fcp, fy, E, s, n, Ab);
mclose(fid);

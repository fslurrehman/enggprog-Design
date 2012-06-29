//Program for Uniaxial Interaction Curve of Rectangular RC- Column
//version 0.03
//Distributed under the license of GNU/GPL v3


//Author: Engr. Faisal ur Rehman
//enggprog.com - Engineering Programs



lines(0) 			// for uninterepted continuous output of calc
exec('preproc.sce',0)   	// preprocessor for new x-section
load('var01.bin')       	// load all input variables.
exec('icurve.sce',0)    	// run main program of interaction curve



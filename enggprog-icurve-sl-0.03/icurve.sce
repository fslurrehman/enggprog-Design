//==============================================================================//
//										//
// Program for Uniaxial Interaction Curve of Rectangular RC- Column		//
// version 0.03									//
// Distributed under the license of GNU/GPL v3					//
//										//
//										//
// Author: Engr. Faisal ur Rehman						//
// enggprog.com - Engineering Programs						//			
// 										//
//==============================================================================//



for i = 1 : length(Ab)
	As(i) = n(i) * Ab(i);
end

d = d1 - d3;
eu = 0.003;
ey = fy / E;

// For Balanced Failure Mode,
cb = d * eu / (eu + ey);
disp(['cb = ', string(cb)])


//full tension

Asfs = 0;
Asfsx =0;	
for j = 1: length(s)
	fs(j) = -fy;
	Asfs = Asfs + As(j)*fs(j);
	Asfsx = Asfsx + As(j)*fs(j)*(d1/2-s(j));
end

Pn(1) = Asfs/1000;
Mn(1) = Asfsx/12000;

c = 0.1;
i = 2;
while c <= d1+.1
	//disp(['loop ran for ', string(i-1)])
	a = 0.85 * c;
	// finding fs
	Asfs = 0;
	Asfsx = 0;	
	for j = 1: length(s)
		fs(j) = eu*E*(c-s(j))/c;
		if fs(j) < 0
			if fs(j) < -fy
	 			fs(j) = -fy;
			end
		elseif fs(j) > 0
			if fs(j) > fy
				fs(j) = fy;
			end
		end
		Asfs = Asfs + As(j)*fs(j);
		Asfsx = Asfsx + As(j)*fs(j)*(d1/2-s(j));
	end

	Pn(i) = (0.85*fcp*d2*a +Asfs)/1000;
	Mn(i) = (0.85*fcp*d2*a*(d1/2-a/2) + Asfsx)/12000;

 	c = c + 0.1;
 	i = i+1;
        
end

//full compression

Asfs = 0;
Asfsx =0;	
for j = 1: length(s)
	fs(j) = fy;
	Asfs = Asfs + As(j)*fs(j);
	Asfsx = Asfsx + As(j)*fs(j)*(d1/2-s(j));
end
lastindex = length(Pn)+1;
Pn(lastindex) = (0.85*fcp*d2*d1 +Asfs)/1000;
Mn(lastindex) = (0.85*fcp*d2*d1*(0) + Asfsx)/12000;





plot(Mn,Pn)
xlabel('Mn (ft-kips)')
ylabel('Pn (kips)')
title('Interaction Curve')
xgrid(1)


A(:,1)=Mn; 			//saves Mn data to Matrix A's first column
A(:,2)=Pn; 			//saves Pn data to Matrix A's second column
write_csv(A, 'data.csv'); 	//save data to csv. note: the csv data contains decimal points as comma and tab as separation of 02 data in linux and my on windows too. you need to repon the data.csv file and find and then replace comma to decimal and then open csv in libreoffice with delimiter as tab. 

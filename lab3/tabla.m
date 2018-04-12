function [] = tabla(XI)
 
  m=length(XI);
  contador1=0;
  contador2=0;
  contador3=0;
  
  prom1=0;
  prom2=0;
  prom3=0;
  
  total=0;
  
  for i=1:length(XI)
    if (XI(i)<=100)
      contador1++;
    endif
    if (XI(i)>100 && XI(i)<=200)
      contador2++;
      
    endif
    if(XI(i)>200)
      contador3++;
    endif
  endfor
  

disp("Rango de area      Porcentaje(%)"); 

prom1=(contador1*100)/m; 
%disp(contador1);
%disp(prom1);
fprintf("1 - 100    %15.2f\n",prom1);

prom2=(contador2*100)/m; 
%disp(contador2);
%disp(prom2);
fprintf("101 - 200  %15.2f\n",prom2);

prom3=(contador3*100)/m; 
%disp(contador3);
%disp(prom3);
fprintf("201 en ad. %15.2f\n",prom3);

total=prom1+prom2+prom3;
fprintf("Total      %15.2f\n",total);

end

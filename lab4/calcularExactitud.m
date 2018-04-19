function EE= calcularExactitud(y, h)
p=(h>=0.5);
c=(y==p);
i=0;
for j=1:length(y)
if (c(j)==1)
  i=i+1;
endif
endfor
EE=(i/length(y))*100;
endfunction
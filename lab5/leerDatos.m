function [XI, Y, XIcv, Ycv, XItest, Ytest] = leerDatos()

l=load('lab5datos.txt');

XI=l(1:590,1:2);
Y=l(1:590,3:3);
XIcv=l(590:786,1:2);
Ycv=l(590:786,3:3);
XItest=l(786:end,1:2);
Ytest=l(786:end,3:3);

endfunction
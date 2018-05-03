function [XI, y, XIcv, ycv, XItest, ytest] = leerDatos()
   d = load('lab5datos.txt');
   n = length(d);
   cant = n * 0.6;
   cantcv = n * 0.2;
   
   XI = d(1:cant,1:2);
   y = d(1:cant, 3:3);
   
   XIcv = d(cant + 1: cant + cantcv,1:2);
   ycv = d(cant + 1:cant + cantcv, 3:3);
   
   XItest = d(cant + cantcv + 1:end, 1:2);
   ytest = d(cant + cantcv + 1:end, 3:3);
endfunction
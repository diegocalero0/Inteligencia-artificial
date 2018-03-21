function [h] = prediccionesConjunto(X, theta)
  h = sigmoide(X * theta);
endfunction
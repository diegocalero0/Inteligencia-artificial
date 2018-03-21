function [g] = sigmoide(z)
  n = size(z, 1);
  g = zeros(n, 1);
  for i = 1 : n
    g(i) = 1 / (1 + exp(z(i) * -1));
  endfor
endfunction
function [X] = agregarUnos(XN)
  r = size(XN, 1);
  U = ones(r, 1);
  X = [U XN];
endfunction
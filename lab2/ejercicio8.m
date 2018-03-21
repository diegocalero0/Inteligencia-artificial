function F = ejercicio8(A, B)
  C = [A ; B];
  D = C(: , 1 : 2);
  E = D + 1;
  F = [D E];
  endfunction
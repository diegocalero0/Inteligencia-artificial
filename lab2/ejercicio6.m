function Z = ejercicio6(A, B)
  D = B' * A;
  E = D * D';
  F = B' * B;
  Z = E - F;
  endfunction
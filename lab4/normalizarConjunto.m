function [XN, mu, sigma] = normalizarConjunto(XI)
  
  r = size(XI, 1);
  c = size(XI, 2);
  
  mu = zeros(c);
  sigma = zeros(c);
  XN = zeros(r, c);
  
  
  for i = 1 : c
    for j = 1 : r
      mu(i) = mu(i) + XI(j, i);
    endfor
    mu(i) = mu(i) / r;
  endfor
  
  for i = 1 : c
    for j = 1 : r
      sigma(i) = sigma(i) + (XI(j, i) - mu(i)) * (XI(j, i) - mu(i));
    endfor
    sigma(i) = sigma(i) / (r - 1);
    sigma(i) = sqrt(sigma(i));
  endfor

  for i = 1 : c
    for j = 1 : r
      XN(j, i) = (XI(j, i) - mu(i)) / sigma(i);
    endfor
  endfor
  
endfunction
function [j] = costo(y, h)
  aux = 0;
  m = length(y);
  j = 0;
  for i = 1 : m
    if y(i) == 1
      aux = -log(h(i));
    endif
    if y(i) == 0
      aux = -log(1 - h(i));
    endif
    j = j + aux;
  endfor
 
  j = j / m;
endfunction
function J = costo(y, h, theta, lambda)
  m = length(y);
  h1=h(find(y==1));
  c1=-log(h1);
  h0=h(find(y==0));
  c2=-log(1-h0);
  J=1/m*sum([c1; c2]);
  % TO DO
  % Implemente a continuación la adición del
  % término de regularización a la función de costo, fórmula (1).
  ...
  %
  J=J+(lambda/(2*m))*sum(theta(2:end).^2);
endfunction
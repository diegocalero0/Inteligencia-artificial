function [theta, J_historia] = descensoGradiente(X, y, alpha, num_iter, lambda)
  m = length(y);
  n = size(X,2)-1;
  J_historia = zeros(num_iter, 1);
  theta = zeros(n+1, 1);
  h=prediccionesConjunto(X,theta);
  for i = 1:num_iter
    grad=1/m*((h-y)'*X)';
    % TO DO
    % Implemente a continuación la regularización,es decir la
    % formula (1)
    ...
    %
    grad(2:end)=grad(2:end)+(lambda/m)*theta(2:end);

    theta=theta-alpha*grad;
    h=prediccionesConjunto(X,theta);
    J_historia(i) = costo(y, h, theta, lambda);
    deci=floor(num_iter/10);

    if( mod(i,deci)==0)
    fprintf("%4d%%",floor(i/num_iter*100)); fflush(stdout);
    endif
  endfor
endfunction
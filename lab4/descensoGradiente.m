function [theta J_historia]=descensoGradiente(X,y,alpha,num_iter)
  theta=[0;0;0];
  h=sigmoide(X*theta);

  m = length(y);
  
  for i=1:num_iter
    g=(1/m)*((h-y)'*X)';
    theta=theta-alpha*g;
    h=sigmoide(X*theta);
    J_historia(i) = costo(y, h);
  endfor
  J_historia = J_historia';
end
function [theta J_historia]=descensoGradiente(X,y,alpha,num_iter)
  theta=[0;0;0];
  h=sigmoide(X*theta);
  J_historia(1)=costo(y,h);

  for i=1:num_iter
    g=(1/length(y))*((h-y)'*X)';
    theta=theta-alpha*g;
    h=sigmoide(X*theta);
    J_historia(i+1)=costo(y,h);
  endfor
end
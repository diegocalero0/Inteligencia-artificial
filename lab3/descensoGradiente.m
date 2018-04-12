function [theta,J_historia] = descensoGradiente(X,y,alpha,num_iter)

m=length(y);
theta = zeros(2, 1); 
h=prediccionesConjunto(X,theta);

for i=1:num_iter
grad=(1/m)*((h-y)'*X)';
theta=theta-(alpha*grad);
h=prediccionesConjunto(X,theta);
J_historia(i)=costo(y,h);

end

J_historia=J_historia';
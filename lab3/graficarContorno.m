% Elabora gráfica de contorno de la función de costo
function graficarContorno(X,y)

% Incializa los vectores theta_0 y theta_1 e inicializa en ceros la matriz J
theta_0 = linspace(-30, 30, 200); 
theta_1 = linspace(0, 2, 200); 
J = zeros(length(theta_0), length(theta_1));

% Calcula el costo para cada par de valores theta_0(i), theta_1(j)
for i = 1:length(theta_0) 
    for j = 1:length(theta_1)
	  theta = [theta_0(i); theta_1(j)];
	  h=prediccionesConjunto(X,theta);
	  J(i,j) = costo(y, h);
    endfor
endfor
J=J'; % debe transponerse J, por requerimientos de la función contour()

figure; 
% Grafica el costo como c contornos espaciados logarítmicamente
% entre 10^a y 10^b
a=0;
b=4;
c=10;
contour(theta_0, theta_1, J, logspace(a, b, c))
xlabel('\theta _0');
ylabel('\theta _1');
title('Grafica de contorno de la funcion de costo');

endfunction
%vcb
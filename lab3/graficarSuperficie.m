% Función que elabora la gráfica de superficie del costo en 
% función de los parámetros theta_0 y theta_1
function graficarSuperficie(X,y)

% Incializa los vectores theta_0 y theta_1 e inicializa en ceros la matriz J
theta_0 = linspace(-1, 3, 50); 
theta_1 = linspace(-1, 3, 50); 
J = zeros(length(theta_0), length(theta_1));

% Calcula el costo para cada par de valores theta_0(i), theta_1(j)
for i = 1:length(theta_0) %
    for j = 1:length(theta_1)
	  theta = [theta_0(i); theta_1(j)];    
	  h=prediccionesConjunto(X,theta);
	  J(i,j) = costo(y, h);
    endfor
endfor
J=J'; % transpone la matriz J por requerimiento de la función surf

% Elabora la gráfica
figure; 
surf(theta_0, theta_1, J)
title('Funcion de costo');
xlabel('\theta_0');
ylabel('\theta_1');
zlabel('Costo');

endfunction

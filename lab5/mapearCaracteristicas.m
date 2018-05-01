function XP = mapearCaracteristicas(XI,grado)
%  Agrega características polinomiales 
% Función tomada del curso de Machine Learning en Coursera
%  Parámetros:
%      XI: matriz de dos columnas de características, un ejemplo por fila 
%      grado: grado del polinomio
%  Retorno
%      XP: una nueva matriz de caracaterísticas con más características que comprenden:  
%         X1, X2, X1.^2, X1.*X2, X2.^2, X1.^3, X1.^2.*X2 etc..
%         donde X1 es la primera columna de XI y X2, la segunda 
%
	m=size(XI,1);
	X1=XI(:,1);
	X2=XI(:,2);
	XP = XI;
	for i = 2:grado
		for j = 0:i
			XP(:, end+1) = (X1.^(i-j)).*(X2.^(j));
		end
	end
end

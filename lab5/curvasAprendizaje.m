function curvasAprendizaje(X, y, Xcv, ycv, alpha, num_iter, lambda)
numEjem=3;
Jtrain=zeros(numEjem,1);
Jcv=Jtrain;
for i=1:numEjem
	fprintf("\n%5d\n", i); fflush(stdout);
	Xt=X(1:i,:);
	yt=y(1:i);
	[theta, J_historia] = descensoGradiente(Xt, yt, alpha, num_iter, lambda);
	fflush(stdout);
	ht = prediccionesConjunto(Xt, theta);
	Jtrain(i)= costo(yt, ht, theta, 0);
	hcv = prediccionesConjunto(Xcv, theta);
	Jcv(i)= costo(ycv, hcv, theta, 0);
endfor
figure
plot(1:numEjem, Jtrain, "r");
title('Curvas de aprendizaje');
xlabel('Numero de ejemplos');
ylabel('Error');

hold on
plot(1:numEjem, Jcv, "m");
legend("Error de entrenamiento", "Error de validacion cruzada");
hold off
endfunction

